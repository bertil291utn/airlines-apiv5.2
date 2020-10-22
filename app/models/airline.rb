class Airline < ApplicationRecord
  has_many :reviews, dependent: :destroy

  before_save :slugify

  def slugify
    self.slug = name.parameterize
  end

  def avg_score
    reviews.average(:score).round(2).to_f
  end

  def as_json(_ = {})
    super(except: %i[created_at updated_at])
  end
end
