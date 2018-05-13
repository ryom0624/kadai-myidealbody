class ChangesController < ApplicationController
  before_action :require_user_logged_in

  def index
    #目標値
    gon.goal_date = current_user.goal.date
    gon.goal_weight = current_user.goal.weight
    gon.goal_fat = current_user.goal.fat

    #ログ
    gon.date = current_user.logs.order(date: :asc).map(&:date)
    gon.weight = current_user.logs.order(date: :asc).map(&:weight)
    gon.fat = current_user.logs.order(date: :asc).map(&:fat)

    #体重と体脂肪率のmax,minをとる
    gon.weight_max = (current_user.logs.map(&:weight).max).to_i
    gon.weight_min = (current_user.logs.map(&:weight).min).to_i
    gon.fat_max = (current_user.logs.map(&:fat).max).to_i
    gon.fat_min = (current_user.logs.map(&:fat).min).to_i

    #目標データを配列の最後に追加
    gon.date << gon.goal_date
    gon.weight << gon.goal_weight
    gon.fat << gon.goal_fat
  end

end

