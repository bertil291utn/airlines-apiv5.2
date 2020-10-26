class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email

  # cache_options enabled: true, cache_length: 12.hours
end
