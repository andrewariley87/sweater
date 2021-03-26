require_relative './lib/weather_request'
require_relative './lib/sweater'
require 'json'

filepath = ARGV.delete_at(ARGV.length - 1)
query    = ARGV.join(' ')
forecast = WeatherRequest.new.get_forecast(query)['main']
sweater  = Sweater.new(forecast, 'test.json')
puts "Suggested items to wear today: #{sweater.generate_recommendations.join(', ')}"