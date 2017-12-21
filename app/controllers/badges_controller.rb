class BadgesController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  private
################################################################################
  
  def find_user
    @user = User.find params[:user_id]
  end
  
end
