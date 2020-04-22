class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      name: params['user']['name'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: {
          data: user,
          records: user.records,
          record_details: user.record_details
        }
      }
    else
      render json: {
        status: 500,
        user: user,
        errors: user.errors.messages
      }
    end
  end
end
