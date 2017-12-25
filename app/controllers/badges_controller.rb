class BadgesController < ApplicationController
  
  def index
    render json: Merit::Badge.select.to_json
  end
  
  def index_user
    find_user
    render json: @user.badges.to_json
  end
  
  private
################################################################################
  
  def find_user
    @user = User.find params[:user_id]
  end
  
end
