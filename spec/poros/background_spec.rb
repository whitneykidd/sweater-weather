require 'rails_helper'

describe Background do
  describe 'class methods' do
    # it 'search(denver, co)' do
    #   VCR.use_cassette('background denver', :record => :new_episodes) do
    #     background = Background.search('denver, co')

    #     expected_url = "https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1Mjk0NX0"
    #     expect(background).to be_a(Background)
    #     expect(background.url).to eq(expected_url)
    #   end
    # end

    it 'search(austin, co)' do
      VCR.use_cassette('background austin') do
        background = Background.search('austin, tx')

        expected_url = "https://images.unsplash.com/photo-1559081632-cfac94fc46d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1Mjk0NX0"
        expect(background).to be_a(Background)
        expect(background.url).to eq(expected_url)
      end
    end

    it 'search(london, uk)' do
      VCR.use_cassette('background london') do
        background = Background.search('london, uk')

        expected_url = "https://images.unsplash.com/photo-1560452992-e3c28ffc6432?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1Mjk0NX0"
        expect(background).to be_a(Background)
        expect(background.url).to eq(expected_url)
      end
    end
  end
end