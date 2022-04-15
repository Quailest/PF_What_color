class Public::CommentsController < ApplicationController
  def create
    photo =Photo.find(params[:photo_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.photo_id =photo.id
    comment.save
    redirect_to public_photo_path(photo)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_photo_path(params[:photo_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:photo_id)
  end

end