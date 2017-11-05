class AnuncisController < ApplicationController
  
  before_action :find_user
  before_action :find_anunci, only: [:show, :update, :destroy]
  
  def index
    render json: @anuncis = Anunci.all
  end

  def create
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
    
  end
  
  def find_user
    @user = User.find params[:user][:id]
  end
  
  def find_anunci
    @anunci = Anunci.find params[:anunci][:id]
  end
  
end
