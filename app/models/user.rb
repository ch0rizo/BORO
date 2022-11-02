class User < ApplicationRecord
  has_one_attached :photo
  has_many :items
  has_many :lendings
  has_many :requests, through: :items, source: :lendings
  has_many :reviews, through: :lendings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, format: { with: /(\+?( |-|\.)?\d{1,2}( |-|\.)?)?(\(?\d{3}\)?|\d{3})( |-|\.)?(\d{3}( |-|\.)?\d{4})/ }, allow_blank: true
  validates :phone_number, uniqueness: true
  validates :about, length: { maximum: 200 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
