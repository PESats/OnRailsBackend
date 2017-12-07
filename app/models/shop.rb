class Shop < ApplicationRecord

  belongs_to :user
  has_many :coupons

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

end
