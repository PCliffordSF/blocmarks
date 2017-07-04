require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id, user_id: user.id)} 
   let(:like) {Like.create(bookmark_id: bookmark.id, user_id: user.id)}
   
  before :each do 
    sign_in user 
  end
  

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
    
  end
  
  

end
