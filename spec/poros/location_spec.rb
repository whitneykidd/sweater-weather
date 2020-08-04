require 'rails_helper'

describe Location do
  describe 'class methods' do
    it 'lat(denver, co)' do
      VCR.use_cassette('location denver') do
        location = Location.find_long_lat('denver, co')
        expect(location.lat).to eq(39.738453)
      end
    end

    it 'lon(denver, co)' do
      VCR.use_cassette('location denver') do
        location = Location.find_long_lat('denver, co')
        expect(location.long).to eq(-104.984853)
      end
    end
  end
end
