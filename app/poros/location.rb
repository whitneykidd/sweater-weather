class Location
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def lat
    # location_json = MapquestService.new.fetch_lat_long(location)
    lat = fetch_location[:results][0][:locations][0][:latLng][:lat]
  end

  def long
    # location_json = MapquestService.new.fetch_lat_long(location)
    lat = fetch_location[:results][0][:locations][0][:latLng][:lng]
  end

  def fetch_location
    MapquestService.new.fetch_lat_long(location)
  end
end