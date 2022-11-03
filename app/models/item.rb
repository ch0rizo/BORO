class Item < ApplicationRecord
  has_many_attached :photos
  has_many :lendings, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :category, inclusion: %w[Stereo Tools Camera Art Surfboards Scubagear Grill Bike Utilities Camping Instruments Wilderness Other]

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

end
