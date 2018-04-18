class LogsController < ApplicationController
  before_action :require_user_logged_in

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
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      flash[:success] = "ログの保存が完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ログの保存に失敗しました"
      render :new
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    flash[:success] = "ログの削除が完了しました"
    redirect_to root_url
  end
  
  private
  
  def log_params
    params.require(:log).permit(:user_id,:date,:weight,:fat)
  end
  
end
