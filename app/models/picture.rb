class Picture < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  
  validates :image, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
