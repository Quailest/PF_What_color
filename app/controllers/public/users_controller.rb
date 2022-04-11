class Public::UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @photos=@user.photos
    
  end

  def edit
  end

  def update
  end

end
