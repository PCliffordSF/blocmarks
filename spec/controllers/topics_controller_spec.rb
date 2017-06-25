require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   
   3.times do
      let(:bookmarks) {Event.create(url: "u@rl", topic_id: topic.id)} 
   end
   
  before :each do 
    sign_in user 
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
      it "returns http redirect" do
        post :create, topic: {title: 'Title'}
        expect(response).to redirect_to(topic_path(1))
      end
    end
    
  describe "DELETE #destroy" do
      it "returns http redirect" do
        delete :destroy, {id: topic.id}
        expect(response).to redirect_to(topics_path)
      end
    end
    
end
