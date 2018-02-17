class LikesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @skill = Skill.find(params[:skill_id])
    #@skill = Like.find(params[:id]).skill 
    @user = User.find_by(id: @skill.user_id)
    unless @skill.plus?(current_user)
      @skill.plus(current_user)
      redirect_to @user
    end
  end

  def destroy
    @skill = Like.find(params[:id]).skill
    @user = User.find_by(id: @skill.user_id)
    if @skill.plus?(current_user)
      @skill.minus(current_user)
      redirect_to @user
    end
  end
end
