class ToppagesController < ApplicationController
  def index
    if logged_in?
      @logs = current_user.logs.order("date desc").page(params[:page])
    end
  end
end
