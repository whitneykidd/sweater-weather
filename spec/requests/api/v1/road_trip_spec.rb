require 'rails_helper'

describe 'Client' do
  it 'can post a road trip' do
    user = create(:user)

    trip_params = {
      origin: 'denver, co',
      destination: 'durango, co'
      api_key: user.api_key
    }

    post api_v1_road_trip_path(params: trip_params)
    expect(response).to have_http_status(200)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('road trip')
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)
  end
end