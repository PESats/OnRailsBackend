class BidsController < ApplicationController
  before_action :find_user, only: [:create]
  #before_action :find_anunci, only: [:anunciBidsIndex]
  before_action :find_bid, only: [:show,:update,:destroy] 
   
  def index

    @user = User.find(bid_index_params[:user_id])
    fil_mode = bid_index_params[:filter_mode]
    @bids = []
    if fil_mode == "accepted"
      @bids = @user.bids.where(accepted: 'true').order(:created_at, :updated_at)
    elsif fill_mode == "selected"
      @bids = @user.anuncis.where(status: "closed").select("selectedBid").order(:created_at, :updated_at)
    else      
      render json: {error: "filter_mode must be selected or accepted" }, status: 400 
    end
    @bids.for_each do |item|
      item = customBidJSON(item)
    end
    render json: @bids, status: :ok
  end 

  def show
    render json: customBidJSON(@bid)
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

  #TODO encapsular user i anunci al GET de Bid
  #TODO Index el bids acceptats dun user 

  private
  ################################################################################

  def bid_params
    params.require(:bid).permit(:amount, :anunci_id)
  end

  def update_bid_params
    params.require(:bid).permit(:amount, :accepted)
  end

  def bid_index_params
    params.permit(:user_id,:filter_mode)
  end

  def find_bid
    auxId = params[:id]
    @bid = Bid.find(auxId)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_anunci
    @user = params[:user_id]
    anunId = params[:anunci_id]
    @anun = @user.anuncis.find(anunId)
  end

  def customBidJSON(mybid)
    mybid.as_json include: [:user, :anunci], root: false
  end
end
