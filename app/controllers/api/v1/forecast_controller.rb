class Api::V1::ForecastController < ApplicationController
  def index
    location = Location.find_long_lat(forecast_params[:location])
    forecast = Forecast.search(location)
    forecast_render(forecast)
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def forecast_render(forecast)
    render json: ForecastSerializer.new(forecast)
  end
end