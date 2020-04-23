class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      name: params['user']['name'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )
    if user
      render json: {
        status: :created,
        logged_in: true,
        user: {
          data: user,
          records: {},
          record_details: {}
        }
      }
    else
      render json: {
        status: "user creation error",
      }
    end
  end
end
