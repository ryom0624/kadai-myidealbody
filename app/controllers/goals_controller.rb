class GoalsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def create
    @goal = current_user.build_goal(goal_params)
    if @goal.save
      flash[:success] = "目標の設定が完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = "目標の設定に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      flash[:success] = "目標の設定を更新しました"
      redirect_to root_url
    else
      flash.now[:danger] = "目標の設定を更新できませんでした"
      render :edit
    end
  end

  private
  
  def goal_params
    params.require(:goal).permit(:user_id,:date,:weight,:fat)
  end
  
  def correct_user
    @goal = current_user.goal
    unless @goal
      redirect_to root_url
    end
  end
  
end
