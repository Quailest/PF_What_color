class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @photos = Photo.looks(params[:search],params[:word])
  end

end
