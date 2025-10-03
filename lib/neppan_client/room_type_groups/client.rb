# frozen_string_literal: true

module NeppanClient
  module RoomTypeGroups
    class Client < NeppanClient::Client
      def root
        'RoomTypeGroupRequest'
      end

      def request_params
        {
          TransactionType: {
            DataFrom: 'FromMetroSystem',
            DataClassification: 'GetRoomTypeGroupInformation',
            SystemDate: system_date_time.strftime('%F'),
            SystemTime: system_date_time.strftime('%T')
          }
        }
      end

      def url_path
        'GetRoomTypeGroup.php'
      end
    end
  end
end
