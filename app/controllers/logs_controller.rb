class LogsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update,:destroy]

  def new
    @log = current_user.logs.build
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      flash[:success] = "ログの保存が完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ログの保存に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @log.update(log_params)
      flash[:success] = "ログの保存が完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ログの保存に失敗しました"
      render :new
    end
  end

  def destroy
    @log.destroy
    flash[:success] = "ログの削除が完了しました"
    redirect_to root_url
  end
  
  private
  
  def log_params
    params.require(:log).permit(:user_id,:date,:weight,:fat,:image)
  end
  
  def correct_user
    @log = current_user.logs.find_by(id: params[:id])
    unless @log
      redirect_to root_url
    end
  end
  
end
