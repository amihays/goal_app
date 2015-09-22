module CommentsHelper
  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :body)
  end
end
