class User < ApplicationRecord

  has_secure_token :active_token
  #validates :name, presence: true
  validates :platform_name, presence: true, inclusion: %w(Twitter Facebook Google)
  validates :email, presence: true

  has_many :anuncis
  has_many :comentaris
  has_many :bids
  has_one  :shop
  has_many :bought_coupons

  def login
    regenerate_active_token
  end

  def logout
    update_attributes(active_token: nil)
  end

  def isLoggedIn?
    active_token != nil
  end

  def valid_token? (token)
    token == active_token
  end

  def selectBid(bid_id)
    selBid = Bid.find(bid_id)

    anun = self.anuncis.find(selBid.anunci_id)
    anun.selectBid(bid_id)
    anun.save   
  end

  def cancelBid(anun_id)
    anun = self.anuncis.find(anun_id)
    #p(anun.selectedBid == nil)
    anun.cancelBidSelection()
    anun.save
  end

  def confirmTaskCompletion(anun_id)
    anun = self.anuncis.find(anun_id)
    sBid = anun.selectedBid
    cost = sBid.amount
    update(coins: coins - cost)
    c_val2 = sBid.user.coins + cost
    sBid.user.update(coins: c_val2)
    anun.status = "completed"
    anun.save
  end
  
  

end
