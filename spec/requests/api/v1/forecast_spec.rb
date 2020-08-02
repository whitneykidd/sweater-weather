require 'rails_helper'

describe 'User', type: :request do
  it 'can retrieve city forecast' do
    VCR.use_cassette('forecast denver') do
      get api_v1_forecast_path(params: { location: 'denver, co' })
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:type]).to eq('forecast')
      expect(json[:data]).to have_key(:attributes)

      expect(json[:data][:attributes][:location][:city]).to eq('Denver')
      expect(json[:data][:attributes][:location][:state]).to eq('CO')
      expect(json[:data][:attributes][:location][:country]).to eq('US')
      expect(json[:data][:attributes]).to have_key(:current)
      expect(json[:data][:attributes]).to have_key(:hourly)
      expect(json[:data][:attributes]).to have_key(:daily)
    end
  end
end