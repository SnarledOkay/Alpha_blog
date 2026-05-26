class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index,:show]
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def new
        @category = Category.new
    end

    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page:params[:page],per_page:6)
    end

    def index
        @categories = Category.paginate(page:params[:page],per_page: 6)
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:notice] = "Category updated successfully!"
            redirect_to @category
        else
            render 'edit'
        end
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "New category created successfully!"
            redirect_to @category
        else
            render 'new'
        end
    end

    def destroy
    end
    
    private
    def set_category
        @category = Category.find(params[:id])
    end
    def category_params
        params.require(:category).permit(:name)
    end
    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Action limited to admins only"
            redirect_to categories_path
        end
    end
end