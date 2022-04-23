class Admin::PhotosController < ApplicationController

  def index
    @photos=Photo.all.order(created_at: :desc)
  end

  def show
    @photo=Photo.find(params[:id])
  end

  def edit
    @photo=Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    redirect_to admin_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :introduction, :location, :lens, :camera, :date, :image, :photo_id)
  end


end
