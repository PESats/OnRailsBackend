class BidsController < ApplicationController
  before_action :find_bid, only: [:show,:update,:destroy]
  def index
    @anunci = Anunci.find(params[:anunci_id])
    render json: @anunci.bids.order(:created_at, :updated_at), include: :user, root: false
  end

  def show
    render json: @bid
  end

  def create

    @usuari = User.find(params[:user_id])
    #p(params)
    @bid = @usuari.bids.new(bid_params)
    if @bid.save
      render json: @bid, root: false, status: :created
    else
      render json: @bid.errors.full_message , status: 400
    end
  end

  def update
    #p(params)
    #p(@bid)
    if @bid.update_attributes update_bid_params
      #p "Sucess!"
      render json: @bid, root: false
    else
      #p "Fail!"
      render json: @bid.errors.full_messages, status: 400
    end
  end

  def destroy
    @bid.destroy
  end

  private
  ################################################################################

  def bid_params
    params.require(:bid).permit(:amount, :anunci_id)
  end

  def update_bid_params
    params.require(:bid).permit(:amount)
  end

  def find_bid
    auxId = params[:id]
    @bid = Bid.find(auxId)
  end

  def find_anunci
    @user = params[:user_id]
    anunId = params[:anunci_id]
    @anun = @user.anuncis.find(anunId)
  end


end
