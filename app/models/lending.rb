class Lending < ApplicationRecord
  belongs_to :item
  belongs_to :user

  enum status: [:pending, :accepted, :declined]
end
