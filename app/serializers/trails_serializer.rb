class TrailsSerializer
  include FastJsonapi::ObjectSerializer
  set_type 'trails'
  attributes :location, :forecast, :trails
end
