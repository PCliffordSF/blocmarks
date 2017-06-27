require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id)} 

   
  before :each do 
    sign_in user 
  end
  
  
  describe "GET #show" do
    it "returns http success" do
      get :show, id: bookmark.id
      expect(response).to have_http_status(:success)
    end
  end
   
  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: bookmark.id
      expect(response).to have_http_status(:success)
    end
  end
  
    describe "POST #create" do
        
    it "increases the number of Bookmarks by 1" do
      expect{ post :create, user_id: user.id, topic_id: topic.id, bookmark: {url: "Url"} }.to change(Bookmark, :count).by(1)
    end
      it "returns http redirect" do
        post :create, topic_id: topic.id, bookmark: {url: 'url'}
        expect(response).to redirect_to(topic_path(1))
      end
    end
    
      describe "DELETE #destroy" do
          
    it "deletes the Topic" do
      bookmark
      expect{ delete :destroy, :id => bookmark.id}.to change(Bookmark, :count).by(-1)
    end
          
      it "returns http redirect" do
        delete :destroy, id: bookmark.id
        expect(response).to redirect_to(topics_path)
      end
      
    end

end
