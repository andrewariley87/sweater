require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../../lib/sweater'

class SweaterTest < Minitest::Test
  def test_raises_error_if_file_is_not_valid_json
    forecast = {
      'temp_max' => 75,
      'temp_min' => 70
    }
    err = assert_raises RuntimeError do
      Sweater.new(forecast, 'invalid.csv')
    end
    assert_equal 'File must be valid json', err.message
  end

  def test_new_sweater_is_created_with_correct_attrs
    forecast = {
      'temp_max' => 75,
      'temp_min' => 70
    }
    file    = 'test.json'
    data    = JSON.parse(File.read("./config/#{file}"))
    sweater = Sweater.new(forecast, file)
    assert_equal [], sweater.items
    assert_equal forecast['temp_max'], sweater.max_temp
    assert_equal forecast['temp_min'], sweater.min_temp
    assert_equal data['available_recommendations'], sweater.data
  end

  def test_generate_recommendations
    forecast = {
      'temp_max' => 75,
      'temp_min' => 70
    }
    file    = 'test.json'
    data    = JSON.parse(File.read("./config/#{file}"))
    sweater = Sweater.new(forecast, file)
    assert_equal ["Rain Jacket", "Comfortable Shoes"], sweater.generate_recommendations
  end
end