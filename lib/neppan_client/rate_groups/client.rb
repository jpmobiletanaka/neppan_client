# frozen_string_literal: true

module NeppanClient
  module RateGroups
    class Client < NeppanClient::Client
      def root
        'RateGroupRequest'
      end

      def request_params
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetRateGroupInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetRateGroup.php'
      end
    end
  end
end
