class ArticlesController < ApplicationController
    def show
        #'article' is currently only available inside 'show' function
        # It will not be recognized by the 'show' front-end
        # Therefore, we must first turn them into an instance variable
        # To convert, just add '@' before the variable
        @article = Article.find(params[:id])
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
        @article = Article.find(params[:id])
    end

    def create 
        @article = Article.new(params.require(:article).permit(:title,:description))
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
        @article = Article.find(params[:id])
        #If stands alone, no validation occurs
        if @article.update(params.require(:article).permit(:title,:description))
            flash[:notice] = "Article updated successfully!"
            redirect_to @article
        else
            render 'edit'
        end
    end
end

