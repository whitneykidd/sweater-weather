require 'rails_helper'

describe 'Client' do
  it 'can post a session' do
    user = create(:user)

    expect(User.count).to eq(1)

    session_params = {
      email: user.email,
      password: user.password
    }

    post api_v1_sessions_path(session_params)
    expect(response).to have_http_status(200)
    expect(User.count).to eq(1)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(user.id.to_s)
    expect(json[:data][:type]).to eq('user')
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it 'cannot post a session with incorrect password' do
    user = create(:user)

    expect(User.count).to eq(1)

    session_params = {
      email: user.email,
      password: 'password'
    }

    post api_v1_sessions_path(session_params)
    expect(response).to have_http_status(401)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq('Incorrect email/password combination')
  end

  it 'cannot post a session with incorrect email' do
    user = create(:user)

    expect(User.count).to eq(1)

    session_params = {
      email: 'email',
      password: user.password
    }

    post api_v1_sessions_path(session_params)
    # expect(response).to have_http_status(401)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq('Incorrect email/password combination')
  end
end