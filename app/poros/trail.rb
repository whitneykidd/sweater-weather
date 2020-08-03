class Trail
  attr_reader :id

  def initialize(trails_info)
    @id = nil

  end

  def self.search(location, forecast)
    trails_json = HikingProjectService.new.fetch_trails(location)
    forecast = forecast_info(forecast.current)
    trails = trails_info(trails_json[:trails], location)
    # binding.pry
    # new(trails_info)
  end

  def self.forecast_info(forecast)
    forecast[:summary] = forecast[:description]
    forecast[:temperature] = forecast[:temperature]
    # filter(forecast, :forecast)
  end

  def self.trails_info(trails_json, location)
    trails_json.map do |trail|
      trail[:name] = trail[:name]
      trail[:summary] = trail[:summary]
      trail[:difficulty] = trail[:difficulty]
      trail[:location] = trail[:location]
      trail[:distance_to_trail] = trail_distance(trail, location)
      # binding.pry
    end
  end
  
  def self.trail_distance(trail, location)
     distance_json = MapquestService.new.fetch_distance(location, trail)
     distance_json[:route][:distance]
     binding.pry
  end
end