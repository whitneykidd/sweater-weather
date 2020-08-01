require 'rails_helper'

describe Location do
  describe 'class methods' do
    it 'lat(denver, co)' do
      VCR.use_cassette('location denver') do
        lat = Location.lat('denver, co')

        expect(lat).to eq(39.738453)
      end
    end

    it 'lon(denver, co)' do
      VCR.use_cassette('location denver') do
        long = Location.long('denver, co')

        expect(long).to eq(-104.984853)
      end
    end
  end
end