class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score
end
