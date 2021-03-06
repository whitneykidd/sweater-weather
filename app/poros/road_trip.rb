class RoadTrip
  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  def initialize(road_trip_info)
    @id = nil
    @origin = road_trip_info[:origin]
    @destination = road_trip_info[:destination]
    @travel_time = road_trip_info[:travel_time]
    @arrival_forecast = road_trip_info[:arrival_forecast]
  end

  def self.plan_trip(road_trip_params)
    destination = Location.find_long_lat(road_trip_params[:destination])
    directions = Directions.search(road_trip_params[:origin], road_trip_params[:destination])
    forecast = Forecast.search(destination)
    arrival_time = Time.now.strftime('%I:%M:%S').to_i + directions.travel_time.to_i
    arrival_forecast = forecast.at_time(arrival_time)
    road_trip_info = prep_road_trip_info(directions, arrival_forecast)
    new(road_trip_info)
  end

  def self.prep_road_trip_info(directions, arrival_forecast)
    {
      origin: directions.origin,
      destination: directions.destination,
      travel_time: directions.travel_time,
      arrival_forecast: arrival_forecast
    }
  end
end
