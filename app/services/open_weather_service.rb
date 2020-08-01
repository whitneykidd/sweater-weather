class OpenWeatherService < BaseService
  def fetch_forecast_by_city(lat, long)
    path = '/data/2.5/onecall'
    params = { appid: ENV['OPEN_WEATHER_API'], lat: lat, lon: long, units: 'imperial', exclude: 'minutely' }
    
    fetch_json(path, params)
  end
  
  private

  def conn
    Faraday.new("https://api.openweathermap.org")
  end
end