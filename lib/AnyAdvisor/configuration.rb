require 'aws-sdk'

module AnyAdvisor
  class Configuration
    attr_accessor :export_image_width, :text_box_width, :default_image_url, :point_size, :font_color, :export_image_path,
                  :truncation_limit, :font_family, :aws_region, :aws_akid, :aws_secret

    def initialize
      @export_image_width = 600
      @export_image_path = './any_advisor.jpg'
      @text_box_width = 500
      @default_image_url = nil
      @point_size = 50
      @font_color = "#fff"
      @truncation_limit = 20
      @font_family = 'Times'
      @aws_region = 'us-east-1'
      @aws_akid = '12345678'
      @aws_secret = '12312345678'
    end

    Aws.config.update({
      region: @aws_region,
      credentials: Aws::Credentials.new(@aws_akid, @aws_secret),
    })
  end
end
