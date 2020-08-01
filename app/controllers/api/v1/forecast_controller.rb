class Api::V1::ForecastController < ApplicationController
  def index
    location = Location.new(forecast_params[:location])
    
    # lat = Location.lat(forecast_params[:location])
    # long = Location.long(forecast_params[:location])
    forecast = Forecast.search(location.lat, location.long)
    binding.pry
    # render json: ForecastSerializer.new(forecast).serialized_json
  end

  private

  def forecast_params
    params.permit(:location)
  end
end