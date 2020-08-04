require 'rails_helper'

describe MapquestService do
  it 'can get location for denver' do
    VCR.use_cassette('location denver') do
      location_json = MapquestService.new.fetch_lat_long('denver, co')
      location_info = location_json[:results][0][:locations]

      expect(location_info[0][:adminArea5]).to eq('Denver')
      expect(location_info[0][:adminArea3]).to eq('CO')
      expect(location_info[0][:adminArea1]).to eq('US')
      expect(location_info[0][:latLng][:lat]).to eq(39.738453)
      expect(location_info[0][:latLng][:lng]).to eq(-104.984853)
    end
  end

  it 'can get location for chicago' do
    VCR.use_cassette('location chicago') do
      location_json = MapquestService.new.fetch_lat_long('chicago, il')
      location_info = location_json[:results][0][:locations]

      expect(location_info[0][:adminArea5]).to eq('Chicago')
      expect(location_info[0][:adminArea3]).to eq('IL')
      expect(location_info[0][:adminArea1]).to eq('US')
      expect(location_info[0][:latLng][:lat]).to eq(41.883229)
      expect(location_info[0][:latLng][:lng]).to eq(-87.632398)
    end
  end

  it 'can get location for london' do
    VCR.use_cassette('location london') do
      location_json = MapquestService.new.fetch_lat_long('london, uk')
      location_info = location_json[:results][0][:locations]

      expect(location_info[0][:adminArea5]).to eq('London')
      expect(location_info[0][:adminArea3]).to eq('ENG')
      expect(location_info[0][:adminArea1]).to eq('GB')
      expect(location_info[0][:latLng][:lat]).to eq(51.50015)
      expect(location_info[0][:latLng][:lng]).to eq(-0.12624)
    end
  end
end
