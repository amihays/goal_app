class UserCommentsController < ApplicationController
  include UserCommentsHelper
  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.poster_id = current_user.id
    if @user_comment.save
      redirect_to user_url(@user_comment.user_id)
    else
      flash[:errors] = @user_comment.errors.full_messages
      redirect_to user_url(@user_comment.user_id)
    end
  end

  def destroy
    user_comment = UserComment.find(params[:id])
    user_comment.destroy!
    redirect_to user_url(user_comment.user_id)
  end
end
