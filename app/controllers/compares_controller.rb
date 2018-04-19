class ComparesController < ApplicationController
  def index
    @log1 = current_user.logs.find_by(date: params[:compare1])
    @log2 = current_user.logs.find_by(date: params[:compare2])
    if params[:goal] == "yes"
      @goal = current_user.goal
    end
  end
end
