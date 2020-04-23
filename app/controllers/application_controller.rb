class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def set_current_user(user)
    @current_user = user
  end
end
