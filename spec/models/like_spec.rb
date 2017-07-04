require 'rails_helper'

RSpec.describe Like, type: :model do
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   let(:bookmark) {Bookmark.create(url: "u@rl", topic_id: topic.id)} 
   let(:like) {Like.create(bookmark_id: bookmark.id, user_id: user.id)}
   
 
   it { is_expected.to belong_to(:user) }
   it { is_expected.to belong_to(:bookmark) }
   
   describe "attributes" do
     it "is expected to have a user_id and bookmark_id attributes" do
       expect(like).to have_attributes(user_id: like.user_id, bookmark_id: like.bookmark_id)
    end
   end
   
end
