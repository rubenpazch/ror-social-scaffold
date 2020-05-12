require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:user2) { FactoryBot.create :user }
  let(:friendship1) { FactoryBot.create :friendship }
  
  before { sign_in user }
  before { sign_in user2 }  

  describe '#new' do
    it 'should initialize empty friendship' do
      get :new, params: { id: user.id }
      expect(user.friendships.empty?).to eql(true)
    end
  end

  describe '#accept' do
    
    #it 'should initialize empty friendship index' do
    #  put :accept, params: { status: 1 }
    #  expect(friendships.empty?).to eql(true)
    #end

    it "updates friendship object status" do
      put :accept, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id, :status =>1 } 
      expect(friendship1.reload.status).to  eql(1)
    end

    it "updates friendship object status and redirect to users_path" do
      put :accept, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id, :status =>1 } 
      expect(response).to  redirect_to users_path
    end

    #it "does not updates friendship object status and redirect to new_user_path" do      
    #  put :accept, params: { :user_id => friendship1.user_id, :friend_id => friendship1.friend_id } 
    #  expect(response).to redirect_to(new_user_registration_url)      
    #end

  end
end
