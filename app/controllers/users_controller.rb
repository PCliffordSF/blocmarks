class UsersController < ApplicationController
 
 def show
  
   @user_bookmarks = Bookmark.where("user_id = ?", current_user.id)

   @likes = Like.where("user_id = ?", current_user.id)
   bookmark_ids = []
   @likes.each do |like|
    bookmark_ids << like.bookmark_id
   end
   @liked_bookmarks = Bookmark.find(bookmark_ids)
 end
   
end
