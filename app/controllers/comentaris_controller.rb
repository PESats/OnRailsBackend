class ComentarisController < ApplicationController

  def index
  end

  def create
    @anunci = Anunci.find(params[:anunci_id])
    @user = User.find(params[:user_id])
    @comentari = @anunci.comentaris.create(comentari_params)
    if @comentari.save
      @user.comentaris << @comentari
      render json: @comentari
    else
      render json: @comentari.errors.full_message, status: 400
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
################################################################################
  def commentari_params
    params.require(:comentari).permit(:text, :user_id, :anunci_id)
  end


end
