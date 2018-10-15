class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :require_login, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = '投稿完了'
      redirect_to pictures_path
    else
      render :new
    end
  end

  def index

  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      flash[:success] = '編集しました'
      redirect_to pictures_path
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:success] = '削除しました'
    pictures_path
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end
end
