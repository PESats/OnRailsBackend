class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :validate_token, only: [:show, :index, :edit, :update, :destroy, :logout]

  def validate_token
    token = params[:active_token]
    id = params[:user_id]
    
    if token && User.exists?(id: id, active_token: token)
      # Nothing
    else
      render json: {error: "Invalid token" }, status: 400
    end
  end
end
