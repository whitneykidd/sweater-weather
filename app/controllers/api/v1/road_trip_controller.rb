class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user.present?
      road_trip = RoadTrip.plan_trip(road_trip_params)
      render json: RoadTripSerializer.new(road_trip)
    else
      error = 'Cannot authenticate API key'
      render json: { error: error }, status: :unauthorized
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end