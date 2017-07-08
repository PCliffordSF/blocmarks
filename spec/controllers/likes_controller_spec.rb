require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:another_user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id, user_id: user.id)} 
   let(:like) {Like.create(bookmark_id: bookmark.id, user_id: user.id)}
   
  before :each do 
    sign_in user 
  end
  
  before(:each) do
    request.env["HTTP_REFERER"] = "previous_page"
  end
  
  context "creating a like on a bookmark created by current_user" do
    describe "POST #create" do
      it "increases the number of Likes by 1" do
        expect{ post :create, user_id: user.id, bookmark_id: bookmark.id }.to change(Like, :count).by(0)
      end
  
      it "returns http redirect" do
        post :create,  user_id: user.id, bookmark_id: bookmark.id
        expect(response).to redirect_to "previous_page"
       end
    end
  end
  
  context "creating a like on a bookmark created by another user" do
    let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id, user_id: another_user.id)} 
    
    describe "POST #create" do
      it "increases the number of Likes by 1" do
        expect{ post :create, user_id: user.id, bookmark_id: bookmark.id }.to change(Like, :count).by(1)
      end
  
      it "returns http redirect" do
        post :create,  user_id: user.id, bookmark_id: bookmark.id
        expect(response).to redirect_to "previous_page"
       end
    end
  end
    
  
  describe "DELETE #destroy" do
      it "deletes the Like" do
        like
        expect{ delete :destroy, id: like.id, bookmark_id: bookmark.id}.to change(Like, :count).by(-1)
    end
    
      it "returns http redirect" do
        delete :destroy, id: like.id, bookmark_id: bookmark.id
        expect(response).to redirect_to "previous_page"
     end
  end

end
