# frozen_string_literal: true

module NeppanClient
  module CalendarSeasonality
    class Client < NeppanClient::Client
      param :rate_calendar_id
      param :term_from
      param :term_to

      def root
        'CalendarSeasonalityRequest'
      end

      def request_params
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetCalendarSeasonalityInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          },
          CalendarSeasonalityList: {
            RateCalendarId: rate_calendar_id,
            TermFrom: term_from.strftime('%F'),
            TermTo: term_to.strftime('%F')
          }
        }
      end

      def url_path
        'GetCalendarSeasonality.php'
      end
    end
  end
end
