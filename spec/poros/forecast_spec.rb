require 'rails_helper'

describe Forecast do
  describe 'class methods' do
    it 'search(juneau, ak)' do
      VCR.use_cassette('forecast juneau') do
        location_info = { lat: 58.301084, long: -134.424524, city: "juneau", state: "ak", country: "us"  }
        location = Location.new(location_info)
        forecast = Forecast.search(location)

        expect(forecast).to be_a(Forecast)
        expect(forecast.location[:city]).to eq("juneau")
        expect(forecast.location[:state]).to eq("ak")
        expect(forecast.location[:country]).to eq("us")

        expect(forecast.current[:description]).to eq("broken clouds")
        expect(forecast.current[:feels_like]).to eq(60.04)
        expect(forecast.current[:humidity]).to eq(60)
        expect(forecast.current[:sunrise]).to eq(1596286243)
        expect(forecast.current[:sunset]).to eq(1596345425)
        expect(forecast.current[:temperature]).to eq(68)
        expect(forecast.current[:time]).to eq(1596321698)
        expect(forecast.current[:uv_index]).to eq(5.07)
        expect(forecast.current[:visibility]).to eq(10000)
        expect(forecast.current.length).to eq(9)
        
        forecast.hourly.each do |hour|
          expect(hour[:temperature]).to be_between(54.95, 68)
          expect(hour[:time]).to be_between(1596319200, 1596488400)                                  
        end
        expect(forecast.hourly.length).to eq(48)

        forecast.daily.each do |day|
          expect(day[:max_temp]).to be_between(52.54, 68)
          expect(day[:min_temp]).to be_between(49.82, 57.02)
          expect(day[:rain]).to be_between(0.72, 1)
        end
      end
    end
  end
end