class ArticlesController < ApplicationController

   def show
      @article = Article.find(params[:id])
   end
   
   def index
      @articles = Article.all
   end    
   
   def new
      @article = Article.new # we are checking for @article error on the first line of new.html.erb.
      # to avoid object reference error (object will not exist first time the page is loaded), we'll create an empty object for 
      # first entry
   end
   
   def edit
      # load the article object for first time page load.. edit.html.erb checks for @article.errors before loading page 
      @article = Article.find(params[:id])
   end
   
   def create
   #    Started POST "/articles" for 76.253.161.147 at 2022-08-01 15:32:43 +0000
   # Cannot render console from 76.253.161.147! Allowed networks: 127.0.0.0/127.255.255.255, ::1
   # Processing by ArticlesController#create as HTML
   #  Parameters: {"authenticity_token"=>"jQyw2/YELOAsUgwpQYB3YFkpiUZGvZYp41D9OcjNYhpdbEhV4pFa6RkOKzb7uvypLsxF/MYUAyc16rkwPzHhkQ==", "article"=>{"title"=>"", "description"=>""}, "commit"=>"Save Article"}
   # without code below we'd see this message on the server when clicking on submit button. To render the following code is required
   # note: article is from the server message "article"=> {"title"=>"..."...
   #render plain: params[:article]
   # similar way to specify params article doesnt work with Article.new, cos article has to be whitelisted for such use
   # the way to do that is as below.
   @article = Article.new(params.require(:article).permit(:title, :description))   
   # render plan: @article # displays object address
   # render plan: @article.inspect # displays the object contents
   
      if @article.save
      # after the article was create, take the following action.
         flash[:notice] = "Article saved !"
         redirect_to articles_path(@article) #, notice: "Article created and saved"  # redirec to page.. 
      #articles_path is from the controller rails prefix. to provide the id use (@article)
      # this fetches the id from the object and passes it so the same page can be reloaded. costhe http request is of the format article/:id
      else
         render 'new' # renders the new action
      end
   end
   
   
   # Update the database with the contents from the form. This is a PATCH action per REST specifications
   
   def update
      # Article.find only gives the unedited form inputs
      @article = Article.find(params[:id])
      # Article.update updates the form values.. same as article.save in create action
      if @article.update(params.require(:article).permit(:title, :description))
         flash[:notice] = "Article was updated"
         redirect_to articles_path(@article)
      else
         render "edit"
      end
   end
   
   def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path(@article)
   end
end