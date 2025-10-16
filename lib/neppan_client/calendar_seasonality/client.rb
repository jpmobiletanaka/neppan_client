# frozen_string_literal: true

module NeppanClient
  module CalendarSeasonality
    class Client < NeppanClient::Client
      def root
        'CalendarSeasonalityRequest'
      end

      def request_params(params)
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetCalendarSeasonalityInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          },
          CalendarSeasonalityList: {
            RateCalendarId: params[:rate_calendar_id],
            TermFrom: params[:term_from].strftime('%F'),
            TermTo: params[:term_to].strftime('%F')
          }
        }
      end

      def url_path
        'GetCalendarSeasonality.php'
      end
    end
  end
end
