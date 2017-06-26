class BookmarksController < ApplicationController
    
    def index
        @bookmarks = Bookmarks.all
        render :index
    end
    
    def new
        @topic = Topic.find(params[:topic_id])
        @bookmark = Bookmark.new
        render :new
    end
    
    def create
        @topic = Topic.find(params[:topic_id])
        @bookmark = @topic.bookmarks.build(url: params[:bookmark][:url])
        
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
      @topic = Topic.find_by id: @bookmark.topic_id
 
     if @topic.destroy
       flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
       redirect_to @topic
     else
       flash.now[:alert] = "There was an error deleting the bookmark."
       redirect_to @topic
     end
  end
end
