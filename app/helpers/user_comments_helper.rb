module UserCommentsHelper
  def user_comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end
end
