require "RMagick"
require 'open-uri'

require 'pry-rails' #dev

module AnyAdvisor
	class Image

		def initialize(body)
			@body = body
		end

		def generate
			begin
				img = Magick::Image.read('http://media-cdn.tripadvisor.com/media/photo-o/03/47/94/63/chania-diving-center.jpg').first

        # Create a new image in memory with transparent canvas
        mark = Magick::Image.new(img.rows, img.columns) {self.background_color = "none"}
        draw = Magick::Draw.new

        # draw is used to add elements to an image like text
        draw.annotate(mark, 0, 0, 0, 0, fit_text(@body, 350)) do
          draw.gravity = Magick::CenterGravity
          draw.pointsize = 50
          # draw.font_family = "Times" # set font
          draw.fill = "white" # set text color
          draw.stroke = "none" # remove stroke
        end

        img = img.dissolve(mark, 0.9, 0.9, Magick::CenterGravity)
        img.write('./test.jpg')
			rescue	StandardError => e
				e.message
			end
		end

		# Fit text in Frame #
		def text_fit?(text, width)
			begin
				tmp_image = Magick::Image.new(width, 500) {self.background_color = 'none'}
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