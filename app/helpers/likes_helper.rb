module LikesHelper
    def users_own_bookmark?
       current_user.id == @bookmark.user_id 
    end
end
