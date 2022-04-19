class CommentsController < ApplicationController
    

    def new
        forum = Forum.find(params[:forum_id])
        @comment = forum.comments.build
    end

    def create
        forum = Forum.find(params[:forum_id])
        @comment = forum.comments.build(comment_params)
        
        if @comment.save
            redirect_to forum_path(forum), notice: 'コメントを作成しました'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    def edit
        forum = Forum.find(params[:forum_id])
        @comment = forum.comments.find(params[:id])
    end
    
    def update
        forum = Forum.find(params[:forum_id])
        @comment = forum.comments.find(params[:id])
        if @comment.update(comment_params)
          redirect_to forum_path(forum), notice: '更新しました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end
    
    def destroy
        forum = Forum.find(params[:forum_id])
        @comment = forum.comments.find(params[:id])
        @comment.destroy!
        redirect_to forum_path(forum), notice: '削除に成功しました'
    end
    
    

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

end