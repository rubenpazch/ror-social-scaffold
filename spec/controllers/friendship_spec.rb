require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
    let(:user) { FactoryBot.create :user }
    let(:friend) { FactoryBot.create :friend }
    let(:friendtwo) { FactoryBot.create :friendtwo }

    before { sign_in user }
    before { sign_in friend }
    before { sign_in friendtwo }

    describe '#accept' do
      it 'should update a friendship object' do
        expect {
          post :addfriend, params: {user_id: user, friend_id: friend, status: 0}
        }.to change(Friendship, :count).by(1)
      end

      it 'redirects to root_path after new object' do
         post :addfriend, params: {user_id: user, friend_id: friendtwo, status: 0}
         expect(response).to redirect_to '/'
      end
    end
    # describe '#new' do
    #     it 'should initialize empty friendship' do
    #       get :new, params: { id: user.id }
    #       expect(user.friendships.empty?).to eql(true)
    #     end
    # end
    #
    # describe '#accept' do
    #   it 'should update status to 1' do
    #       @user1 = User.first
    #       @user2 = User.second
    #       @one = Friendship.create(user_id: @user1, friend_id: @user2, status: 0)
    #       put :accept, :id => @one.id, :friendship => @one.attributes = { :status => 1 }
    #       response.should be_successful
    #   end
    # end
end
