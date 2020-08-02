require 'rails_helper'

describe Background do
  describe 'class methods' do
    it 'search(denver, co)' do
      VCR.use_cassette('background denver') do
        background = Background.search('denver, co')

        expected_url = "https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1Mjk0NX0"
        expect(background).to be_a(Background)
        expect(background.url).to eq(expected_url)
      end
    end


end