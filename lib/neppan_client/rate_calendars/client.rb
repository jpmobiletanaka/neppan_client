# frozen_string_literal: true

module NeppanClient
  module RateCalendars
    class Client < NeppanClient::Client
      def root
        'RateCalendarRequest'
      end

      def request_params
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetRateCalendarInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetRateCalendar.php'
      end
    end
  end
end
