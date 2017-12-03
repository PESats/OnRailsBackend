class BidsController < ApplicationController
  def index
  end

  def show
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
  end

  def destroy
  end

  private
  ################################################################################

  def bid_params
    params.require(:bid).permit(:amount, :anunci_id)
  end


end
