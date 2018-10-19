class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :require_login, only: [:index, :edit, :update]
before_action :correct_user, only: [:edit, :update]

  def new
    if params[:back]
      @user = User.new(user_params) 
    else
      @user = User.new
    end
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "登録完了"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def index
    @users = User.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = '編集しました'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
