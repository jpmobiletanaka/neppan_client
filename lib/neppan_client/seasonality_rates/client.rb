# frozen_string_literal: true

module NeppanClient
  module SeasonalityRates
    class Client < NeppanClient::Client
      param :rate_group_id

      def root
        'SeasonalityRateRequest'
      end

      def request_params
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetSeasonalityRateInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          },
          SeasonalityRateList: {
            RateGroupId: rate_group_id
          }
        }
      end

      def url_path
        'GetSeasonalityRate.php'
      end
    end
  end
end
