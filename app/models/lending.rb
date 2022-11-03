class Lending < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :reviews

  enum status: [:pending, :accepted, :declined]

  validates :start_date, :end_date, :total, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end
