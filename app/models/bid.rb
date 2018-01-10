class Bid < ApplicationRecord
  include Filterable
  belongs_to :anunci
  belongs_to :user
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates_associated :anunci
  validates_associated :user
  validate :bid_and_anunci_dont_share_creators
  validate :target_anunci_must_be_open, on: :create
  def bid_and_anunci_dont_share_creators
    self.errors.add(:base,
    "The bid user_id can't be equal to
     the user_id of the referenced anunci") if self.anunci.present? && self.anunci_id != nil && self.user_id == self.anunci.user_id
  end

  def target_anunci_must_be_open
    self.errors.add(:base, "target_anunci_must_be_open") if self.anunci.present? && !self.anunci.isOpen?
  end
  
  def owner_name
    self.anunci.user.name if self.anunci.present?
  end
  
end
