class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score
  belongs_to :user
  belongs_to :airline

  cache_options enabled: true, cache_length: 12.hours
end
