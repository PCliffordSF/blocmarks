require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id, user_id: user.id, user_name: user.user_name)} 

   
  before :each do 
    sign_in user 
  end
  
  before :each do
    request.env["HTTP_REFERER"] = "previous_page"
  end
  
  
  context "user is peforming CRUD on their own bookmark" do
  
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
  
    describe "POST #create" do
      it "increases the number of Bookmarks by 1" do
        expect{ post :create, user_id: user.id, topic_id: topic.id, bookmark: {url: "Url"} }.to change(Bookmark, :count).by(1)
      end
      
      it "returns http redirect" do
        post :create, topic_id: topic.id, bookmark: {url: 'url'}
        expect(response).to redirect_to(topic_path(1))
      end
    end
    
    describe "GET #edit" do
      it "returns http success" do
        get :edit, id: bookmark.id
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #edit view" do
        get :edit, id: bookmark.id
        expect(response).to render_template :edit
      end
      
      it "assigns bookmark to be updated to @bookmark" do
        get :edit, id: bookmark.id
        bookmark_instance = assigns(:bookmark)

        expect(bookmark_instance.id).to eq bookmark.id
        expect(bookmark_instance.topic_id).to eq topic.id
        expect(bookmark_instance.user_id).to eq user.id
  
      end
    end
    
    describe "PUT #update" do
      # it "updates the bookmark with expected attributes" do

      #   new_user_name = "UserName"
      #   put :update, id: bookmark.id, bookmark: {user_id: user.id, topic_id: topic.id, user_name: new_user_name}

      #   updated_bookmark = assigns(:bookmark)
        # expect(updated_post.id).to eq my_post.id
        # expect(updated_post.title).to eq new_title
        # expect(updated_post.body).to eq new_body
      #end

      # it "redirects to the updated post" do
      #   new_title = RandomData.random_sentence
      #   new_body = RandomData.random_paragraph

      #   put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
      #   expect(response).to redirect_to [my_topic, my_post]
      # end
    end
  
    describe "DELETE #destroy" do
      it "deletes the Bookmark" do
        bookmark
        expect{ delete :destroy, id: bookmark.id}.to change(Bookmark, :count).by(-1)
      end
          
      it "returns http redirect" do
        delete :destroy, id: bookmark.id, topic_id: topic.id
        expect(response).to redirect_to "previous_page"
      end
    end
    
  end #end context "user is performing CRUD on their own Bookmark"

end
