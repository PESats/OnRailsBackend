class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    render json: User.all
  end

  def new
    @user = User.new
  end

  def create
    if find_user
      # Login
      @user.login params[:active_token]
      render json: @user
    else 
      #create user
      @user = User.new user_params
      if @user.save
        render json: @user
      else
        render json: @user.errors.full_messages, status: 400
      end
    end
  end

  def show
    render json: @user
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  
  # TODO:
  def login
  end
  
  def logout
  end

  private
################################################################################

  def user_params
    params.permit(:id, :name, :image_url, :platform_name, :email, :active_token)
  end

  #TODO escollir un dels metodes per la instancia d'usuari actual

  def find_user
    @user = User.find_by(email: params[:email], platform_name: params[:platform_name])
  end

end
