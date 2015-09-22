module GoalsHelper
  def goal_params
    params.require(:goal).permit(:title, :visibility, :completeness)
  end
end
