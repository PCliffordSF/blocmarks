class LikesController < ApplicationController
  def index
  end
  
   def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
     
     authorize like
     
     if like.save
      if current_user.id == @bookmark.user_id 
            flash[:notice] = "You better like your own bookmark!!!"
            redirect_to(:back)
      else
            flash[:notice] = "You liked this bookmark!!!"
            redirect_to(:back)
      end
      
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
