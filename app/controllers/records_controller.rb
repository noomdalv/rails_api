class RecordsController < ApplicationController

  def create
    user = User.find(params["user"]['id'])
    if user
      record = user.records.create!(
        day: params['record']['day'],
        description: params['record']['description']
      )
      details = record.record_details.create!(
        user_id: user.id,
        sleep: params['details']['sleep'],
        work: params['details']['work'],
        exercise: params['details']['exercise'],
        leisure: params['details']['leisure'],
      )
      render json: {
        status: :record_created,
        logged_in: true,
        user: {
          records: user.records,
          data: user,
          record_details: user.record_details
        },
        params: params
      }
    end
  end

  def index
    user = User.find(params['id'])
    if user
      render json: {
        status: :success,
        records: user.records,
        record_details: user.record_details,
        params: params,
      }
    else
      render json: {
        status: 401,
        error: 'user not found'
      }
    end
  end
end
