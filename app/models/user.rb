class User < ApplicationRecord
  validates :display_id, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end
