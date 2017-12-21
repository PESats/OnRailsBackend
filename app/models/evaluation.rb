class Evaluation < ApplicationRecord
    belongs_to :user    
    belongs_to :anunci
    validates_presence_of :user_id
    validates_presence_of :anunci_id
    validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5
    validate :anunci_must_be_complete
    validate :anunci_and_target_user_must_be_associated
    def anunci_must_be_complete
        self.errors.add(:base,
        "The evaluation's anunci must be completed") if self.anunci.present? && !self.anunci.isCompleted?       

    end

    def anunci_and_target_user_must_be_associated
        if self.anunci.present?
            anunUserID = self.anunci.user_id
            selectedBidUserID = self.anunci.selectedBid.user_id
            self.errors.add(:base,
            "The elauation's user must be the one in the selectedBid for which the
            anunci was completed ") if self.user_id != selectedBidUserID || self.user_id == anunUserID
            
        end
    end

    



    end
end
