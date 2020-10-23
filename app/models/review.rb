class Review < ApplicationRecord
  belongs_to :airline
  belongs_to :user

  validates_presence_of :title, :description, :score
  validates_numericality_of :score, greater_than: 0
end
