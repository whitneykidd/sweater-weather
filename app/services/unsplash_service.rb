class UnsplashService < BaseService
  def fetch_background(location)
    path = '/search/photos/?Accept-Version=v1'
    params = { client_id: ENV['UNSPLASH_API'], query: location}
    
    fetch_json(path, params)
  end
  
  private

  def conn
    Faraday.new("https://api.unsplash.com")
  end
end