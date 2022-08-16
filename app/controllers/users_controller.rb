class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
     # instantiate a user method.. and call method to initialise parameters
        @user = User.new(user_params)
        # after the above instruction the control gets transferred to the html.erb file.
        # after the submit button is clicked control returns back to here
        
        if @user.save
            flash[:notice] = "Successfully logged in"
            #route to articles home page after login
            redirect_to articles_path
            
            #below did not work
            # @article = Article.all
            # render 'articles/index'
        else
            render 'new', obj:@user
        end
    end
    
    def edit
        @user = User.find(params[:id])
        
        # redirect doesnt work here.. error: too many redirects
        # redirect_to edit_user_path
        # cos as described in create section. control seems to transfer to the view module 
        # when commented out, we see user#edit transfers to edit.html.erb
        # and everything works fine
    end
    
    def update
        
        # checking user directly doesnt work, we need to instatiate the object even when being routed
        # from edit
        
        @user = User.find(params[:id])
        # note update is different from save
        if @user.update(user_params)
            flash[:notice] = "Successfully updated profile"
            #route to articles home page after login
            redirect_to articles_path
            
            #below did not work
            # @article = Article.all
            # render 'articles/index'
        else
            render 'edit', obj:@user
        end
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
