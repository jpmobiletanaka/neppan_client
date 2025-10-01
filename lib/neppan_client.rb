# frozen_string_literal: true

require_relative "neppan_client/version"
require_relative "neppan_client/base_service"
require_relative "neppan_client/client"

# Load all specific clients
require_relative "neppan_client/calendar_seasonality/client"
require_relative "neppan_client/calendar_seasonality_setting/client"
require_relative "neppan_client/ota_info/client"
require_relative "neppan_client/plans/client"
require_relative "neppan_client/rate_calendars/client"
require_relative "neppan_client/rate_groups/client"
require_relative "neppan_client/room_type_groups/client"
require_relative "neppan_client/room_types/client"
require_relative "neppan_client/seasonality/client"
require_relative "neppan_client/seasonality_rates/client"

module NeppanClient
  class Error < StandardError; end
  class ResponseError < Error; end
  class ConfigurationError < Error; end
end
