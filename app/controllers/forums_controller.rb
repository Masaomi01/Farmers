class ForumsController < ApplicationController
    before_action :set_forum, only: [:show]
    
    def index
        @forums = Forum.all
    end
    def show
    end
    private

    def set_forum
        @forum = Forum.find(params[:id])
    end
end