# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "neppan_client"
  spec.version = "1.1.6"
  spec.authors = [ "duongtv-devruby" ]
  spec.email = [ "t-duong@w.metroengines.jp" ]

  spec.summary = "SC client for Neppan integration"
  spec.description = "A Ruby client library for integrating with Neppan Site Controller system, providing methods to manage room types, plans, rates, and calendar data."
  spec.homepage = "https://github.com/jpmobiletanaka/neppan_client"
  spec.license = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = [ "lib" ]

  # Runtime dependencies
  spec.add_dependency "httparty", "~> 0.18"
  spec.add_dependency "nokogiri", "~> 1.16"
end
