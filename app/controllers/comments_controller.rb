class CommentsController < ApplicationController
  include CommentsHelper
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
  end
end
