# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'AnyAdvisor/version'

Gem::Specification.new do |spec|
  spec.name          = "AnyAdvisor"
  spec.version       = AnyAdvisor::VERSION
  spec.authors       = ["The Mini John"]
  spec.email         = ["the@minijohn.me"]

  spec.summary       = %q{ Scrape Tripadvisor Reviews, optionally export to Image }
  spec.description   = %q{ Scrapes Tripadvisor Reviews and scores them based on a simple adjectives in sentence point System. Optionally you can Export a review to an Image }
  spec.homepage      = "https://github.com/Theminijohn/AnyAdvisor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry-rails'

  spec.add_dependency 'nokogiri', '~> 1.6.6.2'
  spec.add_dependency 'engtagger', '~> 0.2.0'
  spec.add_dependency 'rmagick'
  spec.add_dependency 'aws-sdk', '~> 2.1.4'
end

