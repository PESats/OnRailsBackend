class Comentari < ApplicationRecord
  belongs_to :user
  belongs_to :anunci
  validates :text, presence: true
end
