class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #A session is essentially the refresh token stored in a cookie
            session[:user_id] = user.id
            flash[:notice] = "Welcome, user #{user.username}"
            redirect_to user
        else
            flash.now[:alert] = "Invalid credentials"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out successfully!"
        redirect_to root_path
    end
end