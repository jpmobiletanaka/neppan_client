# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

module NeppanClient
  class Client
    class NeppanResponseError < StandardError; end

    class << self
      def call(sc_account, params = {})
        new(sc_account).call(params)
      end
    end

    def initialize(sc_account)
      @sc_account = sc_account
    end

    def call(params = {})
      xml = prepare_params(params)

      ssl_context = OpenSSL::SSL::SSLContext.new
      ssl_context.min_version = OpenSSL::SSL::TLS1_1_VERSION
      ssl_context.max_version = OpenSSL::SSL::TLS1_1_VERSION

      response = HTTParty.post(url, body: { xml: xml }, ssl_context: ssl_context, encoding: Encoding::UTF_8)
      raise NeppanResponseError, response.parsed_response if error_response?(response)

      response.parsed_response
    end

    private

    attr_reader :sc_account

    def error_response?(response)
      response.code != 200 || response.parsed_response.values&.first&.dig('ResultInformation', 'ResultCode') == '1'
    end

    def url
      "#{sc_account.url}/#{sc_account.sc_system_id}/#{url_path}"
    end

    def prepare_params(params)
      builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.send(root.to_sym) do
          xml.AttestationInformation do
            xml.UserCode sc_account.sc_user_id
            xml.UserPassword sc_account.sc_password
            xml.AccomodationCode sc_account.sc_system_id
          end

          request_params(params).each do |key, value|
            if value.is_a?(Hash)
              xml.send(key.to_sym) do
                value.each { |k, v| xml.send(k.to_sym, v) }
              end
            else
              xml.send(key.to_sym, value)
            end
          end
        end
      end

      builder.to_xml
    end

    def system_date_time
      @_system_date_time ||= DateTime.now
    end

    # Abstract methods to be implemented by subclasses
    def root
      raise NotImplementedError, "Subclasses must implement #root"
    end

    def request_params(_)
      raise NotImplementedError, "Subclasses must implement #request_params"
    end

    def url_path
      raise NotImplementedError, "Subclasses must implement #url_path"
    end
  end
end
