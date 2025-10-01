# frozen_string_literal: true

require_relative "lib/neppan_client/version"

Gem::Specification.new do |spec|
  spec.name = "neppan_client"
  spec.version = NeppanClient::VERSION
  spec.authors = ["Revenue Team"]
  spec.email = ["dev@example.com"]

  spec.summary = "Ruby client for Neppan Site Controller API"
  spec.description = "A Ruby client library for integrating with Neppan Site Controller system, providing methods to manage room types, plans, rates, and calendar data."
  spec.homepage = "https://github.com/jpmobiletanaka/neppan_client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jpmobiletanaka/neppan_client"
  spec.metadata["changelog_uri"] = "https://github.com/jpmobiletanaka/neppan_client/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z 2>/dev/null`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "dry-initializer", "~> 3.0"
  spec.add_dependency "httparty", "~> 0.18"
  spec.add_dependency "nokogiri", "~> 1.16"

  # Development dependencies
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "webmock", "~> 3.0"
end
