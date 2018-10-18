class Picture < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :content, presence: true, length: {maximum: 140}

  paginates_per 10
  default_scope -> {order(created_at: :desc)}
end
