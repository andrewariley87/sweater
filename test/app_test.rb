require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../app'
require_relative '../lib/weather_request'
require_relative '../lib/sweater'

class AppTest < Minitest::Test
  def test_perform_outputs_suggestion
    replacement_argv  = ['kingston,jam', 'test.json']
    mock_sweater      = mock
    recommendations   = ['shorts', 'snow cap']
    forecast_response = {
      'main' => {
        'max_temp' => 85,
        'min_temp' => 42
      }
    }
    ARGV.replace replacement_argv
    WeatherRequest.any_instance.expects(:get_forecast).with('kingston,jam').returns(forecast_response)
    Sweater.expects(:new).with(forecast_response['main'], replacement_argv.last).returns(mock_sweater)
    mock_sweater.stubs(:generate_recommendations).returns(recommendations)
    assert_equal "Suggested items to wear today: #{recommendations.join(', ')}", App.perform
  end

  def test_perform_is_not_called_if_argv_length_is_less_than_two
    ARGV.replace ['a']
    App.expects(:perform).never
  end
end