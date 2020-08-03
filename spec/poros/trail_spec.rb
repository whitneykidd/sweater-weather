require 'rails_helper'

describe Trail do
  describe 'class methods' do
    it 'search(denver, co)' do
      VCR.use_cassette('trail denver') do
        location = Location.find_long_lat('denver, co')
        forecast = Forecast.search(location)
        trails = Trail.search(location, forecast)

        expect(trails).to be_a(Trail)
        expect(trails.location).to eq('Denver, CO')
        expect(trails.forecast[:summary]).to eq('clear sky')
        expect(trails.forecast[:temperature]).to eq(73.4)

        first_trail = trails.trails[0]
        expect(first_trail[:name]).to eq("Boulder Skyline Traverse")
        expect(first_trail[:summary]).to eq("The classic long mountain route in Boulder.")
        expect(first_trail[:difficulty]).to eq("black")
        expect(first_trail[:location]).to eq("Superior, Colorado")
        expect(first_trail[:distance_to_trail]).to eq(23.008)
      end
    end
  end
end