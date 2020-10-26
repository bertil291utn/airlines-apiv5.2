class AirlineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :slug

  # cache_options enabled: true, cache_length: 12.hours
end
