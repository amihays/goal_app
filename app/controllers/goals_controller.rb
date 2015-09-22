class GoalsController < ApplicationController
  include GoalsHelper
  def new
    @user = User.find(params[:user_id])
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end

  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to user_url(@goal.user_id)
    else
      flash[:errors] = ["Not sure why that failed"]
      redirect_to user_url(@goal.user_id)
    end
  end


  def show
    @goal = Goal.find(params[:id])
    render :show
  end
end
