class UsersController < ApplicationController
 def show
  
   @user_bookmarks = Bookmark.where("user_id = ?", current_user.id)
   puts '--------------'
   Rails.logger.info @user_bookmarks.inspect
   puts '-------------------'
   
   @liked_bookarks = Hash.new
   @likes = Like.where("user_id = ?", current_user.id)
   
   @likes.each do |like|
     @liked_bookarks << Bookmark.find(like.bookmark_id)
   end
   
 end
   
end
