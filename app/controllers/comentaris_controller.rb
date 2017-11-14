class ComentarisController < ApplicationController

  before_action :find_comentari, only: [:show,:update,:destroy]
  before_action :check_owner, only: [:update, :destroy]

  def index
  end

  def create
    @anunci = Anunci.find(params[:comentari][:anunci_id])
    @user = User.find(params[:comentari][:user_id])
    @comentari = @anunci.comentaris.create(comentari_params)
    if @comentari.save
      @user.comentaris << @comentari
      render json: @comentari
    else
      render json: @comentari.errors.full_message, status: 400
    end
  end

  def show
    render json: @comentari
  end

  def update
    if @comentari.update_attributes comentari_params
      render json: @comentari
    else
      render json: @comentari.errors.full_messages, status: 400
    end

  end

  def destroy
  end

  private
################################################################################
  def comentari_params
    params.require(:comentari).permit(:text, :user_id, :anunci_id)
  end

  def find_comentari
    @comentari = Comentari.find params[:id]
  end
  def check_owner
    id = params[:user_id]
    #p(id)
    #p(@comentari)
    if @comentari.user_id != id.to_i
      render json: {error: "Un comentari nomes pot ser modificat pel seu creador"},status:400
    end
  end
end
