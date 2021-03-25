require 'dotenv'
Dotenv.load
require 'net/http'
require 'json'

class WeatherRequest
  def get_forecast
    uri    = URI("https://api.openweathermap.org/data/2.5/weather?q=indianapolis,in,usa&units=imperial&appid=#{ENV['WEATHERAPIKEY']}")
    http                     = Net::HTTP.new(uri.host, uri.port)
    request                  = Net::HTTP::Get.new(uri)
    request['Content-Type']  = "application/json"
    res = http.request(request)
    puts JSON.parse(res.body)
  end
end