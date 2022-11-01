class Item < ApplicationRecord
  has_many_attached :photos

  belongs_to :user

  validates :category, inclusion: %w[Stereo Tools Camera Art Surfboards Scubagear Grill Bike Utilities Camping Instruments Wilderness Other]
end
