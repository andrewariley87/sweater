require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../../lib/weather_request'

class WeatherRequestTest < Minitest::Test
  def test_can_make_a_request
    query         = 'kingston,jam'
    uri           = URI("http://api.openweathermap.org/data/2.5/weather?q=#{query}&units=imperial&appid=#{ENV['WEATHERAPIKEY']}")
    net_http_mock = mock
    request_mock  = mock
    body = {
        'min_temp' => -5,
        'max_temp' => 5
    }.to_json
    response      = OpenStruct.new({
      body: body
    })
    Net::HTTP.expects(:new).with(uri.host, uri.port).returns(net_http_mock)
    Net::HTTP::Get.expects(:new).with(uri).returns(request_mock)
    net_http_mock.expects(:request).with(request_mock).returns(response)
    request_mock.expects(:[]=).with('Content-Type', 'application/json')
    WeatherRequest.new.get_forecast(query)
  end
end