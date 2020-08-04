require 'rails_helper'

describe 'Client' do
  it 'can retrieve an image url for a location' do
    VCR.use_cassette('background denver', record: :new_episodes) do
      get api_v1_background_path(params: { location: 'denver,co' })

      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_nil
      expect(json[:data][:type]).to eq('background')
      expect(json[:data][:links][:url]).to eq('https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1Mjk0NX0')
      expect(json[:data].length).to eq(3)
      expect(json[:data][:links].length).to eq(1)
    end
  end
end
