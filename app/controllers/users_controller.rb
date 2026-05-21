class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update,:destroy]
    def show
        
    end

    def new
        @user = User.new
    end

    def edit 
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Changes saved successfully!"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha Blog!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def destroy

    end

    private
    def find_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end
end
