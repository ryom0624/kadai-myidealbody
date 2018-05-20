class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit,:update]
  before_action :set_user, only: [:edit,:update]

  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザの登録を完了しました"
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザを登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザの編集を完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザを編集に失敗しました"
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
