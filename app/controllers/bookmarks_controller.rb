class BookmarksController < ApplicationController

    def new
        @topic = Topic.find(params[:topic_id])
        @bookmark = Bookmark.new
        render :new
    end
    
    def create
        @topic = Topic.find(params[:topic_id])
        @bookmark = @topic.bookmarks.build(url: params[:bookmark][:url])
        @bookmark.user_id = current_user.id
        @bookmark.user_name = current_user.user_name
        
        if @bookmark.save
           flash[:notice] = "Bookmark was added."
           redirect_to [@topic]
        else
           flash.now[:alert] = "There was an error in adding the bookmark. Please try again."
           render :new
        end
    end
    
    def show
        @bookmark = Bookmark.find(params[:id])
        render :show
    end
    
    def edit
        @bookmark = Bookmark.find(params[:id])
        render :edit
    end
    
    def update
        @bookmark = Bookmark.find(params[:id])
        @bookmark.url = params[:bookmark][:url]
        
        authorize @Bookmark
        
         if @bookmark.save
           flash[:notice] = "Bookmark was updated."
           redirect_to @bookmark
         else
           flash.now[:alert] = "There was an error updating the bookmark. Please try again."
           render :edit
         end
    end
    
  def destroy
      @bookmark = Bookmark.find(params[:id])
      puts '-----------------'
      puts params
      puts '==========================='
 
      #authorize @bookmark
     if @bookmark.destroy
       flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
       redirect_to topic_path(params[:topic_id])
     else
       flash.now[:alert] = "There was an error deleting the bookmark."
       redirect_to topic_path(params[:topic_id])
     end
  end
end
