class BoughtCouponsController < ApplicationController
  
  before_action :find_user
  before_action :find_coupon, only: [:show, :update, :destroy]
  
  def index
    render json: @coupons = @user.bought_coupons, root: false
  end

  def create
  end

  def show
    render json: @coupon, root: false
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
    @coupon = BoughtCoupon.find params[:id]
  end
  
  def find_user
    @user = User.find params[:user_id]
  end
  
end
