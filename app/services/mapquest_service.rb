class MapquestService < BaseService
  def fetch_lat_long(location)
    path = '/geocoding/v1/address'
    params = { key: ENV['MAPQUEST_API'], location: location}

    fetch_json(path, params)
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end