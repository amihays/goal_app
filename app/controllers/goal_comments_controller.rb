class GoalCommentsController < ApplicationController
  include GoalCommentsHelper
  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.poster_id = current_user.id
    if @goal_comment.save
      redirect_to goal_url(@goal_comment.goal_id)
    else
      flash[:errors] = @goal_comment.errors.full_messages
      redirect_to goal_url(@goal_comment.goal_id)
    end
  end

  def destroy
    goal_comment = GoalComment.find(params[:id])
    goal_comment.destroy!
    redirect_to goal_url(goal_comment.goal_id)
  end
end
