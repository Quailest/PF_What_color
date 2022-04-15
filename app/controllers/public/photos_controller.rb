class Public::PhotosController < ApplicationController
  def new
    @photo=Photo.new
  end

  def create
    @photo=Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to public_photos_path
  end

  def index
    @photos=Photo.all
  end

  def show
    @photo=Photo.find(params[:id])
    @comment=Comment.new
  end

  def edit
    @photo=Photo.find(params[:id])
  end

  def update
    @photo=Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to public_photo_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    redirect_to public_photos_path
  end

  #ストロングパラメータ
  private

  def photo_params
    params.require(:photo).permit(:title, :introduction, :location, :lens, :camera, :date, :image, :photo_id)
  end
end
