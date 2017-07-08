require 'rails_helper'

describe BookmarkPolicy do
   subject { described_class.new(user, bookmark) }
  
   context 'CRUD on your own bookmark' do
    let(:user) { User.create }
    let(:topic) {Topic.create }
    let(:bookmark) {Bookmark.create(user_id: user.id) }
    
    it { is_expected.to permit_actions([:new, :create, :show, :edit, :update, :destroy]) }
    it { is_expected.to forbid_action([:index]) }
       
   end
   
   context 'CRUD attempted by a non-user' do
       
    let(:user) {}
    let(:topic) {Topic.create }
    let(:bookmark) {Bookmark.create }
    
    it { is_expected.to forbid_actions([:new, :create, :show, :edit, :update, :destroy, :index]) }
       
   end
   
   context 'CRUD attempted on a bookmark not created by user' do
    another_user_id = 86
    let(:user) { User.create }
    let(:topic) {Topic.create }
    let(:bookmark) {Bookmark.create(user_id: another_user_id) }
    
    it { is_expected.to permit_actions([:new, :create, :show]) }
    it { is_expected.to forbid_actions([:edit, :update, :destroy, :index]) }
       
   end
end