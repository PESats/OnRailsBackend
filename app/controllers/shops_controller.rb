class ShopsController < ApplicationController

  def index
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
################################################################################

  def shop_params
    params.require(:anunci).permit(:title, :description, :latitude, :longitude, :reward)
  end

  def find_shop
    @shop = Shop.find params[:id]
  end

  def find_user
    @user = User.find params[:user_id]
  end

end
