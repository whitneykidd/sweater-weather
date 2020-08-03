class HikingProjectService < BaseService
  def fetch_trails(location)
    path = '/data/get-trails'
    params = { key: ENV['HIKING_PROJECT_API'], lat: location.lat, lon: location.long}

    fetch_json(path, params)
  end

  private

  def conn
    Faraday.new("https://www.hikingproject.com")
  end
end