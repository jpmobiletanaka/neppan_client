# frozen_string_literal: true

module NeppanClient
  module Plans
    class Client < NeppanClient::Client
      def root
        'PlanRequest'
      end

      def request_params
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetPlanInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetPlanOTA.php'
      end
    end
  end
end
