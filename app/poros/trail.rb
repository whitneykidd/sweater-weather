class Trail
  attr_reader :id

  def initialize(trails_info)
    @id = nil

  end

  def self.search(location, forecast)
    trails_json = HikingProjectService.new.fetch_trails(location)
    new(trails_info)
  end
end