class Trail
  attr_reader :id

  def initialize(trails_info)
    @id = nil

  end

  def self.search(location, forecast)
    trails_json = HikingProjectService.new.fetch_trails(location)
    forecast = forecast_info(forecast.current)
    binding.pry
    new(trails_info)
  end

  def self.current(forecast)
    forecast[:summary] = forecast[:description]
    forecast[:temperature] = forecast[:temperature]

    # filter(forecast, :forecast)
  end
end