require 'rails_helper'

describe 'User', type: :request do
  it 'can retrieve trails with its information' do
      get api_v1_trails_path(params: { location: 'denver, co' })
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:type]).to eq('trails')
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes][:location]).to eq('Denver, CO')
      expect(json[:data][:attributes]).to have_key(:forecast)
      expect(json[:data][:attributes][:forecast]).to have_key(:summary)
      expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(json[:data][:attributes]).to have_key(:trails)

  end
end