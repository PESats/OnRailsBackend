class AnuncisController < ApplicationController
  
  before_action :find_user
  before_action :find_anunci, only: [:show, :update, :destroy]
  
  def index
    render json: @anuncis = Anunci.all, include: :user, root: false
  end

  def create
    @anunci = @user.anuncis.new anunci_params
    if @anunci.save
      render json: @anunci, root: false
    else
      p @anunci.errors.full_messages
      render json: @anunci.errors.full_messages, status: 400, root: false
    end
  end

  def show
    render json: @anunci, include: :user, root: false
  end

  def update
    if @anunci.update_attributes anunci_params
      #p "Sucess!"
      render json: @anunci, include: :user, root: false
    else
      #p "Fail!"
      render json: @anunci.errors.full_messages, status: 400
    end
  end

  def destroy
    @anunci.destroy
  end
  
  def selectBid
    
    find_anunci    
    @bid = @anunci.bids.find(params[:bid_id])
    @anunci.selectBid(@bid.id)
    @anunci.status = "closed"
    if @anunci.save
      
      render json: @anunci.selectedBid, root: false, status: :ok
    else
      render json: @anunci.errors.full_messages, status: 400
    end
  end

  def cancelBidSelection
    find_anunci
    @anunci.cancelBidSelection
    
    if @anunci.save      
      render json: {message: "Bid succesfully canceled "}, status: :ok
    else
      render json: @anunci.errors.full_messages, status: 400
    end
  end

  def confirmCompletion
    find_anunci
    #find_user
    #@bid = selectedBid
    if @anunci.confirmCompletion
      render json: {message: "Anunci succesfully completed"}, status: :ok
    else
      render json: @anunci.errors.full_messages, status: 400
    end
  end




  
  private
################################################################################
  
  def anunci_params
    params.require(:anunci).permit(:title, :description, :latitude, :longitude, :reward, :selectedBid)
  end
  
  def find_user
    @user = User.find params[:user_id]
  end
  
  def find_anunci
    @anunci = Anunci.find params[:id]
  end

  def bid_select_params
    params.permit(:bid_id)
  end

  




  
  
end
