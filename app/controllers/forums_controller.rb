class ForumsController < ApplicationController
    before_action :set_forum, only: [:show]
    
    def index
        @forums = Forum.all.order("id DESC")
    end

    def show
        @comments = @forum.comments
    end

    def new
        @forum = current_user.forums.build
    end
    
    def create
        @forum = current_user.forums.build(forum_params)
        if @forum.save
          redirect_to forum_path(@forum), notice: '保存しました'
        else
          flash.now[:error] = '保存できません'
          render :new
        end
    end

    


    private

    def forum_params
        params.require(:forum).permit(:title, :content)
    end

    def set_forum
        @forum = Forum.find(params[:id])
    end
end