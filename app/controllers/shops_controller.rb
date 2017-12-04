class ShopsController < ApplicationController

  before_action :find_user
  before_action :find_shop, only: [:show, :update, :destroy]

  def index
    render json: @shops = Shop.all, include: :user, root: false
  end

  def create
    @shop = Shop.new shop_params
    if @user.shop != nil
      render json: "This user has already a shop", status: 400, root: false
    elsif @shop.save
      render json: @shop, root: false
    else
      p @shop.errors.full_messages
      render json: @shop.errors.full_messages, status: 400, root: false
    end
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
    params.require(:shop).permit(:name, :description, :latitude, :longitude, :user_id)
  end

  def find_shop
    @shop = Shop.find params[:id]
  end

  def find_user
    @user = User.find params[:user_id]
  end

end
