class Api::V1::TrailsController < ApplicationController
  def index
    location = Location.find_long_lat(trail_params[:location])
    forecast = Forecast.search(location)
    trails = Trail.search(location, forecast)
    binding.pry
  end

    private

  def trail_params
    params.permit(:location)
  end

end