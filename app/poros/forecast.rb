class Forecast
  attr_reader :id, :current, :hourly, :daily

  def initialize(forecast_info)
    binding.pry
    @id = nil
    @current = forecast_info[:location]
    # @hourly = forecast_info[:location]
    # @daily = forecast_info[:location]

  end

  def self.search(location)
   forecast_json = OpenWeatherService.new.fetch_forecast_by_city(location.lat, location.long)
  #  location = Location.search(location)
   current = current(forecast_json[:current]) 
   binding.pry
  #  hourly = hourly(forecast_json[:current]) 
  #  daily = daily(forecast_json[:current] )
  #  forecast_info = prep_forecast_info(forecast_json)
   new(current)
  end

#   # def self.prep_forecast_info(current, hourly, daily)
#   #   current = 

#   # end

  def self.current(forecast_json)
    weather = forecast_json[:weather][0]
    description = weather[:description]
    feels_like = forecast_json[:feels_like]
    humidity = forecast_json[:humidity]
    sunrise = forecast_json[:sunrise]
    sunset = forecast_json[:sunset]
    temperature = forecast_json[:temp]
    time = forecast_json[:dt]
    uv_index = forecast_json[:uvi]
    visibility = forecast_json[:visibility]
    new(forecast_info)
  end
end