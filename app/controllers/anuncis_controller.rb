class AnuncisController < ApplicationController
  
  before_action :find_user
  before_action :find_anunci, only: [:show, :update, :destroy]
  
  def index
    render json: @anuncis = Anunci.all
  end

  def create
    @anunci = @user.anuncis.new anunci_params
    if @anunci.save
      render json: @anunci
    else
      p @anunci.errors.full_messages
      render json: @anunci.errors.full_messages, status: 400
    end
  end

  def show
    render json: @anunci
  end

  def update
  end

  def destroy
  end
  
  private
################################################################################
  
  def anunci_params
    params.require(:anunci).permit(:title, :description, :latitude, :longitude, :reward)
  end
  
  def user_params
    params.permit(:id, :active_token)
  end
  
  def find_user
    @user = User.find user_params[:id]
  end
  
  def find_anunci
    @anunci = Anunci.find anunci_params[:id]
  end
  
end
