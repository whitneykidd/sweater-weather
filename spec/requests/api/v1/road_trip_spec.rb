require 'rails_helper'

describe 'Client' do
  it 'can post a road trip' do
    user = create(:user)

    trip_params = {
      origin: 'denver, co',
      destination: 'durango, co',
      api_key: user.api_key
    }

    post api_v1_road_trip_path(params: trip_params)
    expect(response).to have_http_status(200)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('road trip')
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes][:origin][:city]).to eq('Denver')
    expect(json[:data][:attributes][:origin][:state]).to eq('CO')
    expect(json[:data][:attributes][:origin][:country]).to eq('US')

    expect(json[:data][:attributes][:destination][:city]).to eq('Durango')
    expect(json[:data][:attributes][:destination][:state]).to eq('CO')
    expect(json[:data][:attributes][:destination][:country]).to eq('US')

    expect(json[:data][:attributes][:travel_time]).to eq('06:03:19')
    expect(json[:data][:attributes][:arrival_forecast][:temperature]).to eq(74.75)
    expect(json[:data][:attributes][:arrival_forecast][:description]).to eq('clear sky')
  end
end