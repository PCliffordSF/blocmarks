class LikesController < ApplicationController
    include LikesHelper
    
    
  def index
  end
  
  
    def create
        @bookmark = Bookmark.find(params[:bookmark_id])
     
        if users_own_bookmark?
            flash[:notice] = "you can't like your own bookmark!!!"
            redirect_to(:back)
        else
    
            like = current_user.likes.build(bookmark: @bookmark)
            authorize like
            if like.save
                flash[:notice] = "You liked this bookmark!!!"
                redirect_to(:back)
            else
              flash.now[:alert] = "There was an error liking this bookmark."
              redirect_to(:back)
            end
        end
    end
    
    def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = Like.find(params[:id])
    
     authorize like
     if like.destroy
        if current_user.id == @bookmark.user_id 
            flash[:notice] = "You just unliked your own bookmark."
            redirect_to(:back)
        
        else
            flash[:notice] = "You no longer like this bookmark!!!"
            redirect_to(:back)
        end
     else
       flash.now[:alert] = "There was an error unliking this bookmark."
       redirect_to(:back)
     end
    end
end
