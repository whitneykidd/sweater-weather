class OpenWeatherService < BaseService
  def fetch_forecast_by_city(location)
    path = '/data/2.5/onecall'
    params = { appid: ENV['OPEN_WEATHER_API'], lat: location.lat,
              lon: location.long, units: 'imperial', exclude: 'minutely' }

    fetch_json(path, params)
  end
  
  private

  def conn
    Faraday.new("https://api.openweathermap.org")
  end
end