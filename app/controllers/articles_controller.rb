class ArticlesController < ApplicationController
    def show
        #'article' is currently only available inside 'show' function
        # It will not be recognized by the 'show' front-end
        # Therefore, we must first turn them into an instance variable
        # To convert, just add '@' before the variable
        @article = Article.find(params[:id])
    end
end

