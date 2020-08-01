require 'rails_helper'

describe Forecast do
  describe 'class methods' do
    it 'search(juneau, ak)' do
      VCR.use_cassette('forecast juneau') do
        forecast = Forecast.search(58.301084, -134.424524)

        expect(forecast).to be_a(Forecast)

        expect(forecast.current[:description]).to eq("123")
        expect(forecast.current[:feels_like]).to eq(123)
        expect(forecast.current[:humidity]).to eq(123)
        expect(forecast.current[:icon_url]).to eq("123")
        expect(forecast.current[:sunrise]).to eq(123)
        expect(forecast.current[:temperature]).to eq(123)
        expect(forecast.current[:time]).to eq(123)
        expect(forecast.current[:uv_index]).to eq(123)
        expect(forecast.current[:uv_rating]).to eq(123)
        expect(forecast.current[:sunset]).to eq(123)
        expect(forecast.current[:visibility]).to eq(123)

        expect(forecast.length).to eq(11)
      end
    end
  end
end