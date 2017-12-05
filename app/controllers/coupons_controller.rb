class CouponsController < ApplicationController
  
  before_action :find_shop
  before_action :find_coupon, only: [:show, :update, :destroy]
  
  def index
    render json: @coupons = Coupon.all, include: :shop, root: false
  end

  def create
  end

  def show
    render json: @coupon, include: :shop, root: false
  end

  def update
  end

  def destroy
  end
  
 private
################################################################################

  def coupon_params
    params.require(:coupon).permit(:title, :description, :shop_id)
  end
  
  def find_coupon
    @coupon = Coupon.find params[:id]
  end
  
  def find_shop
    @user = User.find params[:user_id]
  end
  
end
