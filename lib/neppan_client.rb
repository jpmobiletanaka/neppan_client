# frozen_string_literal: true
require_relative "neppan_client/base_service"
require_relative "neppan_client/client"

# Load all specific clients
Dir[File.join(__dir__, "neppan_client", "*", "client.rb")].sort.each do |file|
  require_relative file.sub(__dir__ + "/", "")
end

module NeppanClient
  class Error < StandardError; end
  class ResponseError < Error; end
  class ConfigurationError < Error; end
end
