class Forecast
  attr_reader :id, :current, :hourly, :daily

  def initialize(forecast_info)
    @id = nil
    @current = forecast[:location]
    @hourly = forecast[:location]
    @daily = forecast[:location]
    binding.pry
  end

  def self.search(lat, long)
   forecast_json = OpenWeatherService.new.fetch_forecast_by_city(lat, long)
  #  location = Location.search(location)
   current = current(forecast_json[:current]) 
   hourly = hourly(forecast_json[:current]) 
   daily = daily(forecast_json[:current] )
   forecast_info = prep_forecast_info(forecast_json)
   new(forecast_info)
  end

  # def self.prep_forecast_info(current, hourly, daily)
  #   current = 

  # end

  def self.current(current_json)
    weather = current_json[:weather][0]
    description = weather[:description]
    binding.pry
  end
end