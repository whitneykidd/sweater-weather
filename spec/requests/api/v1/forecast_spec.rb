require 'rails_helper'

describe 'User', type: :request do
  it 'can retrieve city forecast' do
    VCR.use_cassette('forecast denver', :record => :new_episodes) do
      get api_v1_forecast_path(params: { location: 'denver, co' })
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expec(json[:results].length).to eq(3)
      expect(json[:results]).to have_key(:id)
      expect(json[:results][:type]).to eq('forecast')
      expect(json[:results]).to have_key(:attributes)
      expect(json[:results]).to have_key(:attributes)


    end
  end
end