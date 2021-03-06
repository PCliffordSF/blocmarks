require 'rails_helper'

RSpec.describe Topic, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   
   3.times do
      let(:bookmarks) {Bookmark.create(url: "u@rl", topic_id: topic.id)} 
   end
    
    
   it { is_expected.to belong_to(:user) }
   
   it { should have_many(:bookmarks) }
   
   describe "attributes" do
     it "is expected to have a user_id and title attributes" do
       expect(topic).to have_attributes(user_id: topic.user_id, title: topic.title)
    end
   end
end
