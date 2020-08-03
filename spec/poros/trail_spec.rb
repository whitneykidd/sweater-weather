require 'rails_helper'

describe Trail do
  describe 'class methods' do
    it 'search(denver, co)' do
        location = Location.find_long_lat('denver, co')
        forecast = Forecast.search(location)
        trail = Trail.search(location, forecast)
        # expect(trail).to eq(39.738453)
      end
    end
end