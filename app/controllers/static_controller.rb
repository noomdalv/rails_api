class StaticController < ApplicationController
  def home
    render json: { status: "Rails API running..." }
  end
end
