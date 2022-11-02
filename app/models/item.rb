class Item < ApplicationRecord
  has_many_attached :photos
  has_many :lendings, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :category, inclusion: %w[Stereo Tools Camera Art Surfboards Scubagear Grill Bike Utilities Camping Instruments Wilderness Other]
end
