class User < ApplicationRecord
  
  has_secure_token :active_token
  validates :name, presence: true
  validates :platform_name, presence: true, inclusion: %w(Twitter Facebook Google)
  validates :email, presence: true
  
  
  def login (token)
    update_attributes(active_token: token)
  end
  
  def logout
    update_attributes(active_token: nil)
  end
  
  def isLoggedIn?
    active_token != nil
  end

end
