require 'rails_helper'

RSpec.describe User, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id)} 
   let(:like) {Like.create(bookmark_id: bookmark.id, user_id: user.id)}
   
   it { should have_many(:topics) }
   it { should have_many(:bookmarks) }
   
   describe "attributes" do
     it "has an email, password, and user_name attributes" do
       expect(user).to have_attributes(email: user.email, password: user.password, user_name: user.user_name)
   end
   
   end
end
