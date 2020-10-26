class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score
  belongs_to :user
end
