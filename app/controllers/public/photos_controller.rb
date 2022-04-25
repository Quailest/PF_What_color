class Public::PhotosController < ApplicationController

  def new
    @photo=Photo.new
  end

  def create
    @photo=Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to public_photos_path
    else
      render :new
    end
  end

  def index
    @photos=Photo.all.order(created_at: :desc)
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
    @photo.destroy
    redirect_to public_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :introduction, :location, :lens, :camera, :date, :image, :photo_id, tag_ids: [])
  end
end
