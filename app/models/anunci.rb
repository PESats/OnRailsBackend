class Anunci < ApplicationRecord
  include Filterable
  belongs_to :user
  has_many :comentaris, dependent: :delete_all
  has_many :bids, dependent: :delete_all
  has_one :selectedBid, class_name: "Bid", autosave: true

  validates :title, presence: true
  validates :status, inclusion: {in: ["open","closed","completed"]}

  def selectBid(bid_id)
     
    newSelBid = self.bids.find(bid_id)    
    cancelBidSelection if newSelBid != nil
    
    newSelBid.update(accepted: true)    
    #self.bids.where("id != ? && accept",bid_id).update(accepted: false)
    update(selectedBid_id: bid_id,status:"closed")
    #selectedBid.update(accepted: true)    
    #self.save    
  end

  def cancelBidSelection
    @bid = selectedBid
    if @bid != nil
      bids.where("accepted = ?",true).update(accepted: false)
      update(selectedBid_id: nil,status: "open")
    else
      self.errors.add(:base, "Can't cancel a null selection")
    end
  end

  def confirmCompletion
    @bid = selectedBid
    if @bid != nil
      @buyer = User.find(@bid.user_id)
      new_coins_buyer = @buyer.coins + @bid.amount
      new_coins_owner = self.user.coins - @bid.amount
      @buyer.update(coins: new_coins_buyer)
      self.user.update(coins: new_coins_owner)      
      update(selectedBid_id: nil,status: "completed")
      self.bids.destroy
      true
    else
      self.errors.add(:base, "Can't complete a null selection")
      false
    end    
  end

  def selectedBid
    result = nil
    if selectedBid_id != nil
      result = bids.where("id = ?",selectedBid_id).last
    end
    result
  end

  def isOpen?
    status == "open"
  end




end
