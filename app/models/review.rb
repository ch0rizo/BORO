class Review < ApplicationRecord
  belongs_to :lending
  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :lending_id, scope: [:user_id]
end
