class Evaluation < ApplicationRecord
    belongs_to :user    
    belongs_to :anunci
    validates_presence_of :user_id
    validates_presence_of :anunci_id
    validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5
end
