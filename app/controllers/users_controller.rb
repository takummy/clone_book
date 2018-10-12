class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    if params[:back]
      @user = User.new(user_params) 
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録完了"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end
end
