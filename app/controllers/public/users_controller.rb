class Public::UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @user= User.find(params[:id])
    @photos=@user.photos

  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
