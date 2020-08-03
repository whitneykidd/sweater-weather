class Trail
  attr_reader :id, :location, :forecast, :trails

  def initialize(trails_info)
    @id = nil
    @location = trails_info[:location]
    @forecast = trails_info[:forecast]
    @trails = trails_info[:trails]
  end

  def self.search(location, forecast)
    trails_json = HikingProjectService.new.fetch_trails(location)
    forecast = forecast_info(forecast.current)
    trails = trails_info(trails_json[:trails], location)
    trails_info = prep_trails_info(location, forecast, trails)
    new(trails_info)
  end

  def self.forecast_info(forecast)
    forecast[:summary] = forecast[:description]
    forecast[:temperature] = forecast[:temperature]
    filter(forecast, :forecast)
  end

  def self.trails_info(trails_json, location)
    trails_json.map do |trail|
      trail[:name] = trail[:name]
      trail[:summary] = trail[:summary]
      trail[:difficulty] = trail[:difficulty]
      trail[:location] = trail[:location]
      trail[:distance_to_trail] = trail_distance(trail, location)
      filter(trail, :trails)
    end
  end
  
  def self.trail_distance(trail, location)
     distance_json = MapquestService.new.fetch_distance(location, trail)
     distance_json[:route][:distance]
  end

  def self.filter(json, type)
    case type
      when :forecast then json.slice(:summary, :temperature)
      when :trails then json.slice(:name, :summary, :difficulty, :location, :distance_to_trail)
    end
  end

  def self.prep_trails_info(location, forecast, trails)
    { location: "#{location.city}, #{location.state}",
      forecast: forecast,
      trails:  trails}
  end
end