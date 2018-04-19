class ToppagesController < ApplicationController
  def index
    if logged_in?
      @goal = current_user.goal
      @logs = current_user.logs.order("date desc").page(params[:page]).per(7)
    end
  end
end
