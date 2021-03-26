require_relative './lib/weather_request'
require_relative './lib/sweater'
require 'json'

class App
  def self.perform
    filepath = ARGV.delete_at(ARGV.length - 1)
    query    = ARGV.join(' ')
    forecast = WeatherRequest.new.get_forecast(query)['main']
    sweater  = Sweater.new(forecast, filepath)
    "Suggested items to wear today: #{sweater.generate_recommendations.join(', ')}"
  end
end
puts App.perform if ARGV.length >= 2
