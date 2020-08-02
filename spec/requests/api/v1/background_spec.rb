require 'rails_helper'

describe 'Client' do
  it 'can retrieve an image url for a location' do
    # VCR.use_cassette('background denver') do
      
      get api_v1_background_path(params: { location: 'denver,co' })

      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_nil
      expect(json[:data][:type]).to eq('background')

    # end
  end
end