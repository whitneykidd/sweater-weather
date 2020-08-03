class MapquestService < BaseService
  def fetch_lat_long(location)
    path = '/geocoding/v1/address'
    params = { key: ENV['MAPQUEST_API'], location: location}

    fetch_json(path, params)
  end

  def fetch_distance(location, trail)
    path = '/directions/v2/route'
    params = { key: ENV['MAPQUEST_API'], 
              from: "#{location.city}, #{location.state}",
              to: trail[:location]}

    fetch_json(path, params)
    # binding.pry
  end


  private

  def conn
    Faraday.new("http://www.mapquestapi.com")
  end
end