class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :validate_token, only: [:show, :edit, :update, :destroy]

  def validate_token
    p "Validating Token"
    token = params[:active_token]
    id = params[:id]
    
    if token && User.exists?(id: id, active_token: token)
      p "Correct token"
    else
      p "Invalid token"
      render json: {error: "Invalid token" }, status: 400
    end
  end
end
