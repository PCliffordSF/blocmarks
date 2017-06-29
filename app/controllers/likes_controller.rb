class LikesController < ApplicationController
  def index
  end
  
   def create
     @bookmark = Bookmark.find(params[:bookmark_id])
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

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = Like.find(params[:id])

     authorize like
     if like.destroy
       flash[:notice] = "You no longer like this bookmark!!!"
       redirect_to(:back)
    else
       flash.now[:alert] = "There was an error unliking this bookmark."
       redirect_to(:back)
     end
   end
end
