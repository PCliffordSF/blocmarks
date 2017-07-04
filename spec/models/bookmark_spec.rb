require 'rails_helper'

RSpec.describe Bookmark, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id, user_id: user.id, user_name: user.user_name)} 
   let(:like) {Like.create(bookmark_id: bookmark.id, user_id: user.id)}
   
   
   it { is_expected.to belong_to(:topic) }
   it { should have_many(:likes) }
   
   
   describe "attributes" do
     it "is expected to have a topic_id, user_id and url attributes" do
       expect(bookmark).to have_attributes(topic_id: bookmark.topic_id, user_id: bookmark.user_id, url: bookmark.url)
    end
   end
   
end
