class SessionsController < ApplicationController
  def create
    user = User
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: {
          data: user,
          records: user.records,
          record_details: user.record_details,
          current_user: user,
          session: session
        },
      }
    else
      render json: {
        status: "error",
      }
    end
  end

  def logged_in
    user ||=  User.find_by(id: params["user"]["id"])
    if user
      render json: {
        logged_in: true,
        user: {
          data: user,
          records: user.records,
          record_details: user.record_details
        }
      }
    else
      render json: {
        logged_in: false,
        message: 'user not found'
      }
    end
  end

  def logout
    render json: {
      status: 200,
      logged_out: true
    }
  end
end
