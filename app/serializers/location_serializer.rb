class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type 'location'
  attributes :lat, :long, :city, :state, :country
end