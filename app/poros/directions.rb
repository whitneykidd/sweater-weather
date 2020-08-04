class Directions
  attr_reader :origin, :destination, :travel_time

  def initialize(direction_info)
    @origin = direction_info[:origin]
    @destination = direction_info[:destination]
    @travel_time = direction_info[:travel_time]
  end

  def self.search(origin, destination)
    direction_json = MapquestService.new.fetch_directions(origin, destination)
    origin = Location.find_long_lat(origin)
    destination = Location.find_long_lat(destination)
    direction_info = prep_direction_info(direction_json, origin, destination)
    new(direction_info)
  end

  def self.prep_direction_info(direction_json, origin, destination)
    {
      origin: {
        city: origin.city, state: origin.state, country: origin.country
      },

      destination: {
        city: destination.city, state: destination.state, country: destination.country
      },

      travel_time: direction_json[:route][:formattedTime]
    }
  end
end
