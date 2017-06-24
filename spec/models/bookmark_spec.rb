require 'rails_helper'

RSpec.describe Bookmark, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   
   3.times do
      let(:bookmarks) {Bookmark.create(url: "u@rl", topic_id: topic.id)} 
   end
   
   it { is_expected.to belong_to(:topic) }
   
   describe "attributes" do
     it "is expected to have a topic_id and url attributes" do
       expect(bookmarks).to have_attributes(topic_id: bookmarks.topic_id, url: bookmarks.url)
    end
   end
   
end
