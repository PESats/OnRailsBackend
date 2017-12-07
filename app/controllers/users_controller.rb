class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy, :logout]

  def index
    render json: User.all, root: false
  end

  def create
    login
  end

  def show
    render json: @user, include: :shop, root: false
  end

  #def update
  #end
  
  #def destroy
  #end
  
  def login
    #p  user_params
    if @user = User.find_by(email: user_params[:email], platform_name: user_params[:platform_name])
      # Login
      @user.login
      render json: @user, include: :shop, root: false
    else
      #create user
      @user = User.new user_params
      if @user.save
        render json: @user, include: :shop, root: false
      else
        render json: @user.errors.full_messages, status: 400, root: false
      end
    end
  end
  
  def logout
    @user.logout
  end

  def contacts
    current_contacts = []
    #p(@user.anuncis.where(status: "open"))
    @user.anuncis.where(status: "closed").select("selectedBid").find_each do |b|
      current_contacts.push(b.user)
    end
    render json: current_contacts
  end
  
  # def selectBid
  #   id_bid = user_bid_params[:bid_id]
  #   id_anun = user_bid_params[:anunci_id]
  #   @anun = @user.anuncis.find(id_anun)
  #   @user.selectBid(id_bid)
  #   if @anun.save
  #     render json: @anun.reload.selectedBid
  #   else
  #     render json: @anun.errors.full_messages, status: 400, root: false
  #   end
  # end

  # def cancelBid
  #   id_anun = user_bid_params[:anunci_id]
  #   @user.cancelBid(id_anun)
  #   @user.anuncis.save!
  # end

  # def confirmTaskCompletion
  #   id_anun = user_bid_params[:anunci_id]
  #   @user.confirmTaskCompletion(id_anun)
  #   @user.anuncis.save!
  # end


  private
################################################################################

  def user_params
    params.require(:user).permit(:id, :name, :image_url, :platform_name, :email, :active_token)
  end

  # def user_bid_params
  #   params.require(:bid).permit(:bid_id,:anunci_id)
  # end

  def find_user
    @user = User.find(params[:user_id])
  end

  

end
