class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :email, :password_digest
end
