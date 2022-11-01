class User < ApplicationRecord
  has_one_attached :photo
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
