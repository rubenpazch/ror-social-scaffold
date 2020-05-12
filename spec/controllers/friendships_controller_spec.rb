require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:user2) { FactoryBot.create :user }
  let(:friendship1) { FactoryBot.create :friendship }
  let(:friendship2) { FactoryBot.create :friendship }
  
  before { sign_in user }
  before { sign_in user2 }  

  describe '#new' do
    it 'should initialize empty friendship' do
      get :new, params: { id: user.id }
      expect(user.friendships.empty?).to eql(true)
    end
  end

  describe '#accept' do    
    it "updates friendship object status" do
      put :accept, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id, :status =>1 } 
      expect(friendship1.reload.status).to  eql(1)
    end

    it "updates friendship object status and redirect to users_path" do
      put :accept, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id, :status =>1 } 
      expect(response).to  redirect_to users_path
    end
  end

  describe '#reject' do    
    it "destroy friendship object and count -1" do
      expect { put :reject, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id, :status =>1 } }.to change(Friendship, :count).by(0)      
    end

    it "destroy friendship object and redirect to users_path" do
      put :reject, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id, :status =>1 } 
      expect(response).to  redirect_to users_path
    end
  end
end
