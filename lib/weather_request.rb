require 'dotenv'
Dotenv.load

class WeatherRequest
  def do_something
    puts ENV['S3']
  end
end
