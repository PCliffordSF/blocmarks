require 'rails_helper'

RSpec.describe User, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", user_name: "username", confirmed_at: Time.now) }
  
   3.times do
      let(:topic) {Topic.create(user_id: user.id, name: 'Name', url: 'url@url.com') }
   end
   
   it { should have_many(:topics) }
end
