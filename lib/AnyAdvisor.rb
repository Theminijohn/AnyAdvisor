require "AnyAdvisor/version"
require 'active_support/all'

module AnyAdvisor
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

require 'AnyAdvisor/autoloader'
