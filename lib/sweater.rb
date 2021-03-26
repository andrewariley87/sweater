require 'json'

class Sweater
  attr_reader :max_temp, :min_temp, :data, :file, :items

  def initialize(forecast, file)
    @max_temp = forecast['temp_max']
    @min_temp = forecast['temp_min']
    @file     = file
    @data     = recommendation_data['available_recommendations']
    @items    = []
  end

  def recommendation_data
    JSON.parse(File.read("./config/#{file}"))
  rescue
    raise 'File must be valid json'
  end

  def generate_recommendations
    data.each do |item|
      items << item['name'] if item['min_temp'] <= min_temp && item['max_temp'] >= max_temp
    end
    items
  end
end