require 'rails_helper'

describe HikingProjectService do
  it 'can get location for denver' do
    location = Location.find_long_lat('denver, co')
    trails_json = HikingProjectService.new.fetch_trails(location)

      trails_json[:trails].each do |trail|
      expect(trail).to have_key(:name)
      expect(trail).to have_key(:summary)
      expect(trail).to have_key(:difficulty)
      expect(trail).to have_key(:location)                             
    end
    expect(trails_json[:trails].length).to eq(10)
  end

  it 'can get location for austin' do
    location = Location.find_long_lat('austin, tx')
    trails_json = HikingProjectService.new.fetch_trails(location)

      trails_json[:trails].each do |trail|
      expect(trail).to have_key(:name)
      expect(trail).to have_key(:summary)
      expect(trail).to have_key(:difficulty)
      expect(trail).to have_key(:location)                             
    end
    expect(trails_json[:trails].length).to eq(10)
  end
end