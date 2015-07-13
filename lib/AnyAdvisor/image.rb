require 'RMagick'
require 'open-uri'

require 'pry-rails' #dev

module AnyAdvisor
	class Image
    attr_accessor :config

		def initialize(body, config = Configuration.new)
			@body = body
      @config = config
		end

		def generate
			begin
        config.default_image_url = 'https://s3.amazonaws.com/anyadvisor/any_advisor.jpg'
				img = Magick::Image.read(config.default_image_url).first

        # Create a new image in memory with transparent canvas
        mark = Magick::Image.new(img.rows, img.columns) {self.background_color = "none"}
        draw = Magick::Draw.new

        # draw is used to add elements to an image like text
        draw.annotate(mark, 0, 0, 0, 0, fit_text(@body, config.text_box_width)) do
          draw.gravity = Magick::CenterGravity
          draw.pointsize = AnyAdvisor.configuration.point_size
          # draw.font_family = AnyAdvisor.configuration.font_family # set font
          draw.fill =  AnyAdvisor.configuration.font_color # set text color
          draw.stroke = "none" # remove stroke
        end

        img = img.dissolve(mark, 0.9, 0.9, Magick::CenterGravity)
        # img.write(config.export_image_path)
        img.write('/tmp/image.jpg')

        Aws.config.update({
          region: config.aws_region,
          credentials: Aws::Credentials.new('123', '123'),
        })

        begin
          file_name = "testing-#{Random.rand(10000)}"

          s3 = Aws::S3::Resource.new(region:'us-east-1')
          obj = s3.bucket('anyadvisor').object(file_name + '.jpg')
          obj.upload_file('/tmp/image.jpg', acl: 'public-read')

          image_url = obj.public_url

        rescue Aws::S3::Errors::ServiceError => e
          e.message
        end

			rescue	StandardError => e
				e.message
			end
		end

		# Fit text in Frame #
		def text_fit?(text, width)
			begin
				tmp_image = Magick::Image.new(width, config.export_image_width) {self.background_color = 'none'}
				drawing = Magick::Draw.new
				drawing.annotate(tmp_image, 0, 0, 0, 0, text) { |txt|
					txt.gravity = Magick::NorthGravity
					txt.pointsize = 22
					# txt.fill = "black"
					# txt.font_weight = Magick::BoldWeight
				}
				metrics = drawing.get_multiline_type_metrics(tmp_image, text)
				(metrics.width < width)
			rescue StandardError => e
				error_message = e.message || "Checking .text_fit failure - AnyImage"
			end
		end

    def fit_text(text, width)
      separator = ' '
      line = ''

      if not text_fit?(text, width) and text.include? separator
        i = 0
        text.split(separator).each do |word|
          if i == 0
            tmp_line = line + word
          else
            tmp_line = line + separator + word
          end

          if text_fit?(tmp_line, width)
            unless i == 0
              line += separator
            end
            line += word
          else
            unless i == 0
              line +=  '\n'
            end
            line += word
          end
          i += 1
        end
        text = line
      end
      text
    end

	end
end
