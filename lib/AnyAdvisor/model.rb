require 'active_support/core_ext/string/inflections'

module AnyAdvisor
  class Model

    # @!attribute [r] raw
    # @return [Hash] raw version of options Hash used to initialize Model
    attr_read :raw

    def initialize options = {}
      @raw = options
      options.each do |attribute_name, value|
        send "#{attribute_name.to_s.underscore}=", value
      end
    end

  end
end
