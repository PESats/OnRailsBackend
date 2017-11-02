class User < ApplicationRecord

  has_secure_token :active_token
  #validates :name, presence: true
  validates :platform_name, presence: true, inclusion: %w(Twitter Facebook Google)
  validates :email, presence: true

  has_many :anuncis
  has_many :comentaris

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

end
