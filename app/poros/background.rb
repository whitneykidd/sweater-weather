class Background
  attr_reader :id, :url

  def initialize(background_info)
    @id = nil
    @url = background_info[:url]
  end

  def self.search(location_query)
    background_json = UnsplashService.new.fetch_background(location_query)
    background_info = { url: background_json[:results][0][:urls][:raw]}
    new(background_info)
  end
end