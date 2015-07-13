module AnyAdvisor
  class Configuration
    attr_accessor :export_image_width, :text_box_width, :default_image_url, :point_size, :font_color, :export_image_path,
                  :truncation_limit, :font_family

    def initialize
      @export_image_width = 500
      @export_image_path = './any_advisor.jpg'
      @text_box_width = 350
      @default_image_url = nil
      @point_size = 50
      @font_color = "#fff"
      @truncation_limit = 20
      @font_family = 'Times'
    end
  end
end
