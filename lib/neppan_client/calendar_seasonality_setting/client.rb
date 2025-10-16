# frozen_string_literal: true

module NeppanClient
  module CalendarSeasonalitySetting
    class Client < NeppanClient::Client
      def root
        'CalendarSeasonalitySettingRequest'
      end

      def request_params(_params)
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'SetCalendarSeasonalityInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def prepare_params(params)
        info = {
          AttestationInformation: {
            UserCode: sc_account.sc_user_id,
            UserPassword: sc_account.sc_password,
            AccomodationCode: sc_account.sc_system_id
          }
        }
        info.merge(request_params(params))
        doc = Nokogiri::XML(info.merge(request_params(params)).to_xml(root: root))
        doc.at(root).add_child(rate_params(params))
        doc.to_xml
      end

      def rate_params(rates)
        rates.map do |rate_calendar_id, dates|
          <<-XML
            <CalendarSeasonalityList>
              <RateCalendarId>#{rate_calendar_id}</RateCalendarId>
              #{date_params(dates)}
            </CalendarSeasonalityList>
          XML
        end.join
      end

      def date_params(dates)
        dates.map do |use_date, seasonality_id|
          <<-XML
            <SettingDateList>
              <UseDate>#{use_date.strftime('%F')}</UseDate>
              <SeasonalityId>#{seasonality_id}</SeasonalityId>
            </SettingDateList>
          XML
        end.join
      end

      def url_path
        'SetCalendarSeasonality.php'
      end
    end
  end
end
