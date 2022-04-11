class Public::PhotosController < ApplicationController
  def new
    @photo=Photo.new
  end

  def create
    @photo=Photo.new(photo_params)
    @photo.user_id = current_user.id
    @ohoto.save
    redirect_to public_photos_path
  end

  def index
    @photos=Photo.all
  end

  def show
    @photo=Photo.find(params[:id])
  end

  def edit
    @photo=Photo.find(params[:id])
  end

  def update

  end
  #ストロングパラメータ
  private

  def photo_params
    params.require(:photo).permit(:title, :introduction, :location, :lens, :camera, :date, :image)
  end
end
