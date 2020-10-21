class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :email, :password_digest

  def as_json(_ = {})
    super(except: %i[created_at updated_at password_digest])
  end
end
