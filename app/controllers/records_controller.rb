class RecordsController < ApplicationController
  include CurrentUserConcern

  def create
    if @current_user
      record = @current_user.records.create!(
        day: params['record']['day'],
        description: params['record']['description']
      )
      if record
        details = record.record_details.create!(
          user_id: @current_user.id,
          sleep: params['details']['sleep'],
          work: params['details']['work'],
          exercise: params['details']['exercise'],
          leisure: params['details']['leisure'],
        )
        if details
          render json: {
            status: :record_created,
            logged_in: true,
            user: {
              records: @current_user.records,
              data: @current_user,
              record_details: @current_user.record_details
            }
          }
        else
          render json: {
            status: 401
          }
        end
      end
    end
  end

  def index
    records = @current_user.records
    if records
      render json: {
        status: :success,
        records: @current_user.records,
        record_details: @current_user.record_details
      }
    else
      render json: {
        status: 401
      }
    end
  end
end
