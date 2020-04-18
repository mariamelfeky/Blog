class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :destroy]

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to article_path(@article)
    end
     
    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
    def set_comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end

end
