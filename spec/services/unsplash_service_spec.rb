require 'rails_helper'

describe UnsplashService do
  it 'can retrieve background json for location' do
    VCR.use_cassette('background london') do
      background_json = UnsplashService.new.fetch_background('london, uk')

      expected_url = 'https://images.unsplash.com/photo-1560452992-e3c28ffc6432?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1Mjk0NX0'
      expect(background_json[:results][0][:urls][:raw]).to eq(expected_url)
    end
  end
end
