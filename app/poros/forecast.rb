class Forecast
  attr_reader :current, :daily, :hourly, :id, :location

  def initialize(forecast_info)
    # binding.pry
    @id = nil
    @current = forecast_info[:current]
    @hourly = forecast_info[:hourly]
    @daily = forecast_info[:daily]
  end

  def self.search(location)
   forecast_json = OpenWeatherService.new.fetch_forecast_by_city(location)
  #  location = Location.search(location)
   current = current(forecast_json[:current]) 
  #  binding.pry
   hourly = hourly(forecast_json[:hourly]) 
   daily = daily(forecast_json[:daily])
   forecast_info = prep_forecast_info(location, current, hourly, daily)
  #  binding.pry
   new(forecast_info)
  end

  def self.current(current_json)
    current_json[:description] = current_json[:weather][0][:description]
    current_json[:feels_like] = current_json[:feels_like]
    current_json[:humidity] = current_json[:humidity]
    current_json[:sunrise] = current_json[:sunrise]
    current_json[:sunset] = current_json[:sunset]
    current_json[:temperature] = current_json[:temp]
    current_json[:time] = current_json[:dt]
    current_json[:uv_index] = current_json[:uvi]
    current_json[:visibility] = current_json[:visibility]
# binding.pry
    filter(current_json, :current)
    # binding.pry
  end

  def self.hourly(hourly_json)
    hourly_json.map do |hour_json|
      # binding.pry
      hour_json[:temperature] = hour_json[:temp]
      hour_json[:time] = hour_json[:dt]
      # binding.pry
      filter(hour_json, :hourly)
    end
  end

  def self.daily(daily_json)
    daily_json.map do |day_json|
      day_json[:description] = day_json[:weather][0][:main]
      day_json[:max_temp] = day_json[:temp][:max]
      day_json[:min_temp] = day_json[:temp][:min]
      day_json[:rain] = day_json[:pop] ||= 0
      # binding.pry
      filter(day_json, :daily)
    end
    
  end

  def self.prep_forecast_info(location, current, hourly, daily)
    {
      location: {
        city: location.city, state: location.state, country: location.country
      },
      current: current, hourly: hourly, daily: daily
      
    }
  end

  def self.filter(json, type)
    # binding.pry
    case type
      when :current then json.slice(
      :time, :temperature, :description, :sunrise, :sunset,
      :feels_like, :humidity, :uv_index, :visibility
     )
      when :hourly then json.slice(:description, :temperature, :time)
      when :daily then json.slice(
        :description, :max_temp, :min_temp, :rain
    )
    end


  end
end