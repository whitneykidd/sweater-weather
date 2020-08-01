# class Forecast
#   attr_reader :id, :current, :hourly, :daily

#   def initialize(forecast_info)
#     binding.pry
#     @id = nil
#     @current = forecast_info[:location]
#     @hourly = forecast_info[:location]
#     @daily = forecast_info[:location]
#     binding.pry
#   end

#   def self.search(lat, long)
#    forecast_json = OpenWeatherService.new.fetch_forecast_by_city(lat, long)
#   #  location = Location.search(location)
#    current = current(forecast_json[:current]) 
#   #  hourly = hourly(forecast_json[:current]) 
#   #  daily = daily(forecast_json[:current] )
#   #  forecast_info = prep_forecast_info(forecast_json)
#    new(current)
#   end

#   # def self.prep_forecast_info(current, hourly, daily)
#   #   current = 

#   # end

#   def self.current(current_json)
#     weather = current_json[:weather][0]
#     description = weather[:description]
#     feels_like = current_json[:feels_like]
#     humidity = current_json[:humidity]
#     sunrise = current_json[:sunrise]
#     sunset = current_json[:sunset]
#     temperature = current_json[:temp]
#     time = current_json[:dt]
#     uv_index = current_json[:uvi]
#     visibility = current_json[:visibility]
#     # binding.pry
#   end
# end