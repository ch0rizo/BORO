class User < ApplicationRecord
  has_one_attached :photo
  has_many :items
  has_many :lendings
  has_many :requests, through: :items, source: :lendings
  has_many :reviews, through: :lendings

  validates :first_name, :last_name, :email, presence: true
  validates :email, :phone_number, uniqueness: true
  validates :phone_number, format: { with: /(\+?( |-|\.)?\d{1,2}( |-|\.)?)?(\(?\d{3}\)?|\d{3})( |-|\.)?(\d{3}( |-|\.)?\d{4})/ }, allow_blank: true
  validates :about, length: { maximum: 300 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
