class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action  :valid_active_token, only: [:show, :edit, :update, :destroy]

  def valid_active_token
    p "Validating Token"
    p "Params: #{request.headers.to_s}"
    atoken = request.headers[:active_token]

    if atoken
      p "API Key succesfully validated"
      return User.exists?(active_token: atoken)
    else
      p "API KEY not found"
      return false
    end
  end
end
