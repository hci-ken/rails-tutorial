class SkillsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    def create
        @skill = current_user.skills.build(skill_params)
        @user = current_user
        @skills = @user.skills.paginate(page: params[:page])
        if @skill.save
            flash[:success] = "Skill created!"
            redirect_to @user
        else
            render template: "users/show"
        end
    end

    def destroy
    end

    private

        def skill_params
            params.require(:skill).permit(:name)
        end
end
