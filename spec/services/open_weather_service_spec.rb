require 'rails_helper'

describe OpenWeatherService do
  it 'can get weather by city and state' do
    VCR.use_cassette('forecast austin') do
      location = Location.find_long_lat('austin, tx')
      json = OpenWeatherService.new.fetch_forecast_by_city(location)

      expect(json[:current][:feels_like]).to eq(96.66)
      expect(json[:current][:humidity]).to eq(59)
      expect(json[:current][:sunrise]).to eq(1_596_369_028)
      expect(json[:current][:sunset]).to eq(1_596_417_832)
      expect(json[:current][:temp]).to eq(89.29)
      expect(json[:current][:dt]).to eq(1_596_384_462)
      expect(json[:current][:uvi]).to eq(10.44)
      expect(json[:current][:visibility]).to eq(10_000)
      expect(json[:current][:weather][0][:description]).to eq('scattered clouds')

      json[:hourly].each do |hour|
        expect(hour[:temp]).to be_between(68, 100.92)
        expect(hour[:dt]).to be_between(1_596_384_000, 1_596_996_000)
      end
      expect(json[:hourly].length).to eq(48)

      json[:daily].each do |day|
        expect(day[:temp][:max]).to be_between(93.83, 102.43)
        expect(day[:temp][:min]).to be_between(76.6, 82.92)
        expect(day[:pop]).to be_between(0, 1)
      end
    end
  end
end
