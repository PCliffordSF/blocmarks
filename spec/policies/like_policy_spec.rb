require 'rails_helper'

describe LikePolicy do
   
   subject { described_class.new(user, like) }
  
   context 'creating and destroying a like' do
    let(:user) { User.create }
    let(:bookmark) {Bookmark.create(user_id: user.id) }
    let(:like) { Like.create(user_id: user.id, bookmark_id: bookmark.id) }
    
    it { is_expected.to permit_actions([:new, :create, :destroy, :show]) }
    it { is_expected.to forbid_actions([:edit, :update, :index]) }
   end
   
end