class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :validate_token, only: [:show, :edit, :update, :destroy]

  def validate_token
    p "Validating Token"
    token = params[:active_token]
    id = params[:id]
    
    if token
      p "API Key succesfully validated"
      if User.exists?(id: id, active_token: token)
        p "Correct token"
        true
      else
        p "Invalid token"
        false
      end
    else
      p "API KEY not found"
      return false
    end
  end
end
