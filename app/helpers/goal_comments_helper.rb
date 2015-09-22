module GoalCommentsHelper
  def goal_comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end
end
