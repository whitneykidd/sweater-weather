require 'rails_helper'

describe HikingProjectService do
  it 'can get location for denver' do
    # VCR.use_cassette('location denver') do
      location = Location.find_long_lat('denver, co')
      trails_json = HikingProjectService.new.fetch_trails(location)
binding.pry

    end
  end