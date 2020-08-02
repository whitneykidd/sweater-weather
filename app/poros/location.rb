class Location
  attr_reader :lat, :long, :city, :state, :country
  def initialize(location_info)
    @lat = location_info[:lat]
    @long = location_info[:long]
    @city = location_info[:city]
    @state = location_info[:state]
    @country = location_info[:country]
  end

  def self.find_long_lat(location)
    location_json = MapquestService.new.fetch_lat_long(location)
    location_info = prep_location_info(location_json)   
    new(location_info)
  end

  def self.prep_location_info(location_json)
    lat = location_json[:results][0][:locations][0][:latLng][:lat]
    long = location_json[:results][0][:locations][0][:latLng][:lng]
    city = location_json[:results][0][:locations][0][:adminArea5]
    state = location_json[:results][0][:locations][0][:adminArea3]
    country = location_json[:results][0][:locations][0][:adminArea1]
    { lat: lat, long: long, city: city, state:state, country:country }
  end
end