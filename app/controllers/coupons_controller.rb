class CouponsController < ApplicationController
  
  before_action :find_user
  before_action :find_coupon, only: [:show, :update, :destroy]
  
  def index
    render json: @coupons = Coupon.all, include: :shop, root: false
  end

  def create
    @coupon = Coupon.new coupon_params
    if !correct_ownership?
      render json: "The user must be the owner of the shop", status: 400, root: false
    elsif @coupon.save
      render json: @coupon, root: false
    else
      p @coupon.errors.full_messages
      render json: @coupon.errors.full_messages, status: 400, root: false
    end
  end

  def show
    render json: @coupon, include: :shop, root: false
  end

  def update
  end

  def destroy
    if !@coupon.destroy
      render json: "Could not delete the coupon", status: 400
    else
      render json: "", status: 204
    end
  end
  
 private
################################################################################

  def coupon_params
    params.require(:coupon).permit(:title, :description, :shop_id)
  end
  
  def find_coupon
    @coupon = Coupon.find params[:id]
  end
  
  def find_user
    @user = User.find params[:user_id]
  end
  
  def correct_ownership?
    @user.shop.id == coupon_params[:shop_id].to_i
  end
  
end
