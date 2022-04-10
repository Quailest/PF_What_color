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
  end


  #ストロングパラメータ
  private

  def photo_params
    params.require(:photo).permit(:title, :introduction, :location, :lens, :camera, :date, :image)
  end
end
