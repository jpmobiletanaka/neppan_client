# frozen_string_literal: true

module NeppanClient
  module Seasonality
    class Client < NeppanClient::Client
      def root
        'SeasonalityRequest'
      end

      def request_params(_params)
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetSeasonalityInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetSeasonality.php'
      end
    end
  end
end
