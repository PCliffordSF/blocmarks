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
        puts '========================'
        puts params
        
        if @bookmark.save
           flash[:notice] = "Bookmark was added."
           redirect_to [@topic]
        else
           flash.now[:alert] = "There was an error in adding the bookmark. Please try again."
           render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
end
