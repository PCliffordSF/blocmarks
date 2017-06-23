require 'rails_helper'

RSpec.describe Topic, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
   let(:topic) {Topic.create(user_id: user.id, name: 'Name', url: 'url@url.com') }
   
   3.times do
      let(:bookmarks) {Event.create(url: "u@rl", topic_id: topic.id)} 
   end
    
    
   it { is_expected.to belong_to(:user) }
   
   it { should have_many(:bookmarks) }
end
