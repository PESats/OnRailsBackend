class Comentari < ApplicationRecord
  belongs_to :user
  belongs_to :anunci
end
