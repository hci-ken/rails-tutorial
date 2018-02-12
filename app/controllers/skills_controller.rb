class SkillsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    def create
        @user = User.find(params[:skill][:user_id])
        @skill = @user.skills.build(skill_params)
        @skills = @user.skills.paginate(page: params[:page])
        if @skill.save
            flash[:success] = "Skill created!"
            redirect_to @user
        else
            render template: "users/show"
        end
    end

    def destroy
        #@skill.destroy
        Skill.find(params[:id]).destroy
        flash[:success] = "Skill deleated"
        redirect_to request.referrer || root_url
    end

    private

        def skill_params
            params.require(:skill).permit(:name,:user_id)
<<<<<<< HEAD
=======
        end

        def correct_user
            @skill = current_user.skills.find_by(id: params[:id])
            redirect_to root_url if @skill =nil?
>>>>>>> user-skills
        end
end
