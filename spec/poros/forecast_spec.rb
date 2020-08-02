require 'rails_helper'

describe Forecast do
  describe 'class methods' do
    it 'search(juneau, ak)' do
      VCR.use_cassette('forecast juneau') do
        location_info = { lat: 58.301084, long: -134.424524, city: "juneau", state: "ak", country: "us"  }
        location = Location.new(location_info)
        forecast = Forecast.search(location)

        expect(forecast).to be_a(Forecast)

        expect(forecast.current[:description]).to eq("broken clouds")
        expect(forecast.current[:feels_like]).to eq(60.04)
        expect(forecast.current[:humidity]).to eq(60)
        expect(forecast.current[:sunrise]).to eq(1596286243)
        expect(forecast.current[:sunset]).to eq(1596345425)
        expect(forecast.current[:temperature]).to eq(68)
        expect(forecast.current[:time]).to eq(1596321698)
        expect(forecast.current[:uv_index]).to eq(5.07)
        expect(forecast.current[:visibility]).to eq(10000)

        expect(forecast.length).to eq(11)


        expect(forecast.hourly[0][:description]).to eq("light rain")
        expect(forecast.hourly[0][:temperature]).to eq(68.0)
        expect(forecast.hourly[0][:time]).to eq("1596319200")

      end
    end
  end
end