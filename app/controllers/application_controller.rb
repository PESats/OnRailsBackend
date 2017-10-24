class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action  :valid_active_token, only: [:show, :edit, :update, :destroy]

  def valid_active_token
    p "Validating Token"
    token = params[:active_token]
    p token
    
    if token
      p "API Key succesfully validated"
      return User.exists?(active_token: token)
    else
      p "API KEY not found"
      return false
    end
  end
end
