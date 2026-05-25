class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update,:destroy]
    before_action :require_user, only: [:edit,:update,:destroy]
    before_action :require_same_user, only: [:edit,:update,:destroy]
    def show
        @articles = @user.articles
    end

    def index
        @users = User.paginate(page:params[:page],per_page:6)
    end

    def new
        @user = User.new
    end

    def edit 
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Changes saved successfully!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Alpha Blog!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def destroy
        @user.destroy 
        #Do this or else admin is logged out if he deletes an account
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account and all associated articles successfully deleted!"
        redirect_to root_path
    end

    private
    def find_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end
    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "Unauthorized to perform this action!"
            redirect_to @user
        end
    end
end
