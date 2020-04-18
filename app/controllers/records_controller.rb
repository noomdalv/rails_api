class RecordsController < ApplicationController
  include CurrentUserConcern

  def create
    if @current_user
      record = @current_user.records.create!(
        day: params['record']['day'],
      )
      if record
        render json: {
          status: :created,
          userRecords: @current_user.records
        }
      else
        render json: {
          status: 401
        }
      end
    end
  end
end
