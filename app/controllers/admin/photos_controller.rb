class Admin::PhotosController < ApplicationController

#新規投稿順での表示
  def index
    @photos=Photo.all.order(created_at: :desc)
#タグの追加
    if params[:tag]
      Tag.create(name: params[:tag])
    end
#タグ検索用
    if params[:tag_ids]
      @photos = []
      params[:tag_ids].each do |key, value|
        @photos += Tag.find_by(name: key).photos if value == "1"
      end
      @photos.uniq!
    end
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
