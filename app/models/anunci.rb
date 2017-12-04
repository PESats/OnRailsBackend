class Anunci < ApplicationRecord
  belongs_to :user
  has_many :comentaris, dependent: :delete_all
  has_many :bids, dependent: :delete_all
  has_one :selectedBid, class_name: "Bid", autosave: true

  validates :title, presence: true
  validates :status, inclusion: {in: ["open","closed","completed"]}

  def selectBid(bid_id)
    selectedBid = bids.find(bid_id)
    selectedBid.update(accepted: true)
    update(status:"closed")
    #self.save    
  end

  def cancelBidSelection()
    selectedBid.update(accepted: false)    
    update(selectedBid_id: nil,status: "open")
  end

  def isOpen?
    status == "open"
  end




end
