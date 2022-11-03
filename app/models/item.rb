class Item < ApplicationRecord
  has_many_attached :photos
  has_many :lendings, dependent: :destroy

  belongs_to :user


  validates :title, :description, :category, :price, :deposit, presence: true
  validates :description, length: { maximum: 500 }
  validates :category, inclusion: %w[Stereo Tools Camera Art Surfboards Scubagear Grill Bike Utilities Camping Instruments Wilderness Other]
  validates :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :deposit, numericality: { greater_than_or_equal_to: 0 }
  validates :title, length: { maximum: 25 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
