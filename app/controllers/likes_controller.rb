class LikesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @skill = Skill.find(params[:skill_id]) 
    unless @skill.plus?(current_user)
      @skill.plus(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url}
        format.js
      end
    end
  end

  def destroy
    @skill = Like.find(params[:id].micropost)
    if @skill.plus?(current_user)
      @skill.minus(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
