class ChangesController < ApplicationController
  before_action :require_user_logged_in
  before_action :logs_check, only: [:index]

  def index
    #目標値
    gon.goal_date = current_user.goal.try!(:date)
    gon.goal_weight = current_user.goal.try!(:weight)
    gon.goal_fat = current_user.goal.try!(:fat)

    #ログ
    gon.date = current_user.logs.order(date: :asc).map(&:date)
    gon.weight = current_user.logs.order(date: :asc).map(&:weight)
    gon.fat = current_user.logs.order(date: :asc).map(&:fat)

    #体重と体脂肪率のmax,minをとる
    gon.weight_max = (current_user.logs.map(&:weight).max).to_i
    gon.weight_min = (current_user.logs.map(&:weight).min).to_i
    gon.fat_max = (current_user.logs.map(&:fat).max).to_i
    gon.fat_min = (current_user.logs.map(&:fat).min).to_i

    #目標データを配列の最後に追加 目標データがない場合には飛ばす。
    if current_user.goal.present?
      gon.date << gon.goal_date
      gon.weight << gon.goal_weight
      gon.fat << gon.goal_fat
    end

    @current_log = current_user.logs.order(date: :asc).last 
    @goal = current_user.goal

  end
  
  private
  
  def logs_check
    if current_user.logs.blank?
      flash[:danger] = "推移グラフを見る為には、ログの入力が必要です。"
      redirect_to new_log_url
    end
  end

end

