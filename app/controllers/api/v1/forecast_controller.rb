class Api::V1::ForecastController < ApplicationController
  def index
    location = Location.find_long_lat(forecast_params[:location])
    forecast = Forecast.search(location)
    render json: ForecastSerializer.new(forecast)
    binding.pry
  end

  private

  def forecast_params
    params.permit(:location)
  end
end