# frozen_string_literal: true

module NeppanClient
  module OtaInfo
    class Client < NeppanClient::Client
      def root
        'OTARequest'
      end

      def request_params(_params)
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetOTAInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetOTA.php'
      end
    end
  end
end
