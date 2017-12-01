class ShopsController < ApplicationController

  before_action :find_user
  before_action :find_shop, only: [:show, :update, :destroy]

  def index
    render json: @shops = Shop.all, include: :user, root: false
  end

  def create
  end

  def show
    render json: @shop, include: :user, root: false
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
