class UserPhoto < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 30 }
  validates :image, presence: true
end
