class SessionsController < ApplicationController

def new
    
end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # here we handle session using browser cookies
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        redirect_to user
    else
        # using .now cos flash persists for one full http request, render is not a fresh http request
        # unlike redirect_to
        # flash.now[:alert] = "Login details incorrect"
        flash.now[:alert] = "Error logging in"
        render 'new'
    end
end

def destroy
    byebug
    session[:user_id] = nil
    flash[:notice] = "Logged out"
end

end