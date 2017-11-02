class Anunci < ApplicationRecord
  belongs_to :user
  has_many :comentaris

  validates :title, presence: true
end
