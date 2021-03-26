require_relative './weather_request'
require 'json'

class Sweater
  attr_reader :max_temp, :min_temp, :data, :filepath, :items

  def initialize(forecast, filepath)
    @max_temp = forecast['temp_max']
    @min_temp = forecast['temp_min']
    @filepath = filepath
    @data     = recommendation_data['available_recommendations']
    @items    = []
  end

  def recommendation_data
    JSON.parse(File.read("./config/#{filepath}"))
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