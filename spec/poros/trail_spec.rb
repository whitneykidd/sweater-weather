require 'rails_helper'

describe Trail do
  describe 'class methods' do
    it 'search(denver, co)' do
      # VCR.use_cassette('location denver') do
        trail = Trail.search('denver, co')
        expect(trail[:]).to eq(39.738453)
      # end
    end
end