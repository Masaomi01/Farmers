class ProfilesController < ApplicationController
    before_action :authenticate_user!

    
    
    def show
    end

    def edit
        @profile = current_user.prepare_profile
    end
    def update
        @profile = current_user.prepare_profile
        @profile.assign_attributes(profile_params)
        if @profile.save
            redirect_to profile_path, notice: 'プロフィールを更新しました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end

    end


    private
    def profile_params
        params.require(:profile).permit(
            :nickname,
            :introduction,
            :avatar
        )
    end

end