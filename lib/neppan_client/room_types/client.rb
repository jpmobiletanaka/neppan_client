# frozen_string_literal: true

module NeppanClient
  module RoomTypes
    class Client < NeppanClient::Client
      def root
        'RoomTypeRequest'
      end

      def request_params(_params)
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetRoomTypeInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetRoomTypeOTA.php'
      end
    end
  end
end
