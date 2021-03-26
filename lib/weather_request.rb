require 'dotenv'
Dotenv.load
require 'net/http'
require 'json'

class WeatherRequest
  def get_forecast(query)
    uri                      = URI("http://api.openweathermap.org/data/2.5/weather?q=#{query}&units=imperial&appid=#{ENV['WEATHERAPIKEY']}")
    http                     = Net::HTTP.new(uri.host, uri.port)
    request                  = Net::HTTP::Get.new(uri)
    request['Content-Type']  = 'application/json'
    res = http.request(request)
    JSON.parse(res.body)
  end
end