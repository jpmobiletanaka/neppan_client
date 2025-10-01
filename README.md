# NeppanClient

A Ruby client library for integrating with Neppan Site Controller system, providing methods to manage room types, plans, rates, and calendar data.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add neppan_client

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install neppan_client

## Usage

### Basic Setup

First, create an account object that implements the required interface:

```ruby
class ScAccount
  attr_accessor :url, :sc_system_id, :sc_user_id, :sc_password
  
  def initialize(url:, sc_system_id:, sc_user_id:, sc_password:)
    @url = url
    @sc_system_id = sc_system_id
    @sc_user_id = sc_user_id
    @sc_password = sc_password
  end
end
```

### Using the Clients

```ruby
require 'neppan_client'

# Create account
account = ScAccount.new(
  url: 'https://api.neppan.com',
  sc_system_id: 'your_system_id',
  sc_user_id: 'your_user_id',
  sc_password: 'your_password'
)

# Get room types
room_types = NeppanClient::RoomTypes::Client.call(account)

# Get plans
plans = NeppanClient::Plans::Client.call(account)

# Get rate calendars
rate_calendars = NeppanClient::RateCalendars::Client.call(account)

# Get calendar seasonality with parameters
seasonality = NeppanClient::CalendarSeasonality::Client.call(
  account, 
  rate_calendar_id: '123',
  term_from: Date.today,
  term_to: Date.today + 30.days
)

# Get seasonality rates
seasonality_rates = NeppanClient::SeasonalityRates::Client.call(
  account,
  rate_group_id: '456'
)
```

### Available Clients

- `NeppanClient::CalendarSeasonality::Client` - Get calendar seasonality information
- `NeppanClient::CalendarSeasonalitySetting::Client` - Set calendar seasonality information
- `NeppanClient::OtaInfo::Client` - Get OTA information
- `NeppanClient::Plans::Client` - Get plan information
- `NeppanClient::RateCalendars::Client` - Get rate calendar information
- `NeppanClient::RateGroups::Client` - Get rate group information
- `NeppanClient::RoomTypeGroups::Client` - Get room type group information
- `NeppanClient::RoomTypes::Client` - Get room type information
- `NeppanClient::Seasonality::Client` - Get seasonality information
- `NeppanClient::SeasonalityRates::Client` - Get seasonality rate information

### Error Handling

```ruby
begin
  result = NeppanClient::Plans::Client.call(account)
rescue NeppanClient::ResponseError => e
  puts "API Error: #{e.message}"
rescue NeppanClient::Error => e
  puts "General Error: #{e.message}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpmobiletanaka/neppan_client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
