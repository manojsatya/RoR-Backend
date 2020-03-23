class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @article = Article.find(params[:article_id])
        render json: @article.comments
    end
    

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        render json: @article
    end

    private
    def comment_params
        params.require(:comment).permit(:name, :comment)
    end
end
