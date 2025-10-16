# frozen_string_literal: true

module NeppanClient
  module SeasonalityRates
    class Client < NeppanClient::Client
      def root
        'SeasonalityRateRequest'
      end

      def request_params(params)
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetSeasonalityRateInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          },
          SeasonalityRateList: {
            RateGroupId: params[:rate_group_id]
          }
        }
      end

      def url_path
        'GetSeasonalityRate.php'
      end
    end
  end
end
