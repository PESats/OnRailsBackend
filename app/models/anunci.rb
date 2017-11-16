class Anunci < ApplicationRecord
  belongs_to :user
  has_many :comentaris, dependent: :delete_all

  validates :title, presence: true
end
