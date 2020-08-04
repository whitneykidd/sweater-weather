require 'rails_helper'

describe Directions do
  describe 'class methods' do
    it 'search(denver, durango)' do
      origin = 'denver, co'
      destination = 'durango, co'

      directions = Directions.search(origin, destination)

      expect(directions).to be_a(Directions)
      expect(directions.origin[:city]).to eq('Denver')
      expect(directions.origin[:state]).to eq('CO')
      expect(directions.origin[:country]).to eq('US')
      expect(directions.destination[:city]).to eq('Durango')
      expect(directions.destination[:state]).to eq('CO')
      expect(directions.destination[:country]).to eq('US')
      expect(directions.travel_time).to eq('06:03:19')
    end
  end
end