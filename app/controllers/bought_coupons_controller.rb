class BoughtCouponsController < ApplicationController

  before_action :find_user
  before_action :find_bought_coupon, only: [:show, :update, :destroy]

  def index
    render json: @bought_coupons = @user.bought_coupons, root: false
  end

  def create
    coupon = Coupon.find(coupon_params[:coupon_id])
    if @user.coins < coupon.price
      render json: "Not enough money dude", status: 400
    else
      @user.update_attribute("coins", @user.coins - coupon.price)
      @bought_coupon = @bought_coupon = @user.bought_coupons.create(
        title: coupon.title,
        description: coupon.description,
        discount: coupon.discount,
        shop_id: coupon.shop_id)
      render json: @user, include: :shop, root: false
    end
  end

  def show
    render json: @bought_coupon, root: false
  end

  def update
  end

  def destroy
    if !@bought_coupon.destroy
      render json: "Could not delete the bought coupon", status: 400
    else
      render json: "", status: 204
    end
  end

 private
################################################################################

  def coupon_params
    params#.permit(:coupon_id)
  end

  def find_bought_coupon
    @bought_coupon = BoughtCoupon.find params[:id]
  end

  def find_user
    @user = User.find params[:user_id]
  end
  
  # You only exist for convinience
  def current_user
    return @user
  end

end
