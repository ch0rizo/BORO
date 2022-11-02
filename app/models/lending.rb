class Lending < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :reviews

  enum status: [:pending, :accepted, :declined]
end
