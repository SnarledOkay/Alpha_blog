class ArticlesController < ApplicationController
    # 'before_action': perform action before any of the listed method
    before_action :set_article, only:[:show,:edit,:update,:destroy]

    #No need for any content because action is already performed
    def show
    end

    def index
        @articles = Article.all
    end

    def new
        #initialize @article immediately upon running
        #error handling can work well for both failed / first execution
        @article = Article.new
    end

    def edit
    end

    def create 
        @article = Article.new(article_params)
        #If '@article.save' fails, that means user runs into ValidationError
        #We just have to check if this function fails
        if @article.save
            #'flash' is a helper method used to display message to the user
            #it works kinda like a hash, and we usually use 2 names 
            flash[:notice] = "Article was created successfully!"
            redirect_to @article #even this is possible
        else
            #just returns a new registration form
            render 'new'
        end
    end 

    def update
        #If stands alone, no validation occurs
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    #'private' is not a method - do NOT put an 'end' at the end
    # Everything written after 'private' is a method private to this controller
    # Functions that are used in other files MUST NOT be after 'private'
    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title,:description)
    end
end

