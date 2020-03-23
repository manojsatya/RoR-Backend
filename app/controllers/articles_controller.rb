class ArticlesController < ApplicationController

    skip_before_action :verify_authenticity_token
    

    before_action :set_article, only: [:show, :destroy, :update]


    def index
        @articles = Article.all
        render json: @articles
    end
    
    def show  
    render json: @article
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            render json: @article, status: :created
        else 
            render json: {error: "error"}
        end
    end

    def update
 
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        if @article.destroy
            render json: { status: 'ok' }
        else
            render json: {error: "error"}
        end
    end


    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :text)
    end
end
 