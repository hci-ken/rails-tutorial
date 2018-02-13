class LikesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @user = User.find(params[:like][:user_id])
    @skill = Skill.find(params[:skill_id]) 
    unless @skill.plus?(current_user)
      @skill.plus(current_user)
      @skill.reload
      #respond_to do |format|
      #  format.html { redirect_to request.referrer || root_url}
      #  format.js
      #end
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:like][:user_id])
    @skill = Like.find(params[:id]).skill
    if @skill.plus?(current_user)
      @skill.minus(current_user)
      @skill.reload
      #respond_to do |format|
      #  format.html { redirect_to request.referrer || root_url }
      #  format.js
      #end
      redirect_to @user
    end
  end
end
