require 'rails_helper'

RSpec.describe User, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
  
   3.times do
      let(:topic) {Topic.create(user_id: user.id, title: 'Title') }
   end
   
   it { should have_many(:topics) }
   
   describe "attributes" do
     it "has an email, password, and user_name attributes" do
       expect(user).to have_attributes(email: user.email, password: user.password, user_name: user.user_name)
   end
   
   end
end
