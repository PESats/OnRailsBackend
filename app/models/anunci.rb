class Anunci < ApplicationRecord
  belongs_to :user
  has_many :comentaris, dependent: :delete_all
  has_many :bids, dependent: :delete_all

  validates :title, presence: true
end
