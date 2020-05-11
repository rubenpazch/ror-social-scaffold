require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:friend) { FactoryBot.create :friend }
  let(:friendtwo) { FactoryBot.create :friendtwo }

  before { sign_in user }
  before { sign_in friend }
  before { sign_in friendtwo }

  describe '#addfriend' do
    it 'should create a new friendship object' do
      expect {
        post :addfriend, params: {user_id: user, friend_id: friend, status: 0}
      }.to change(Friendship, :count).by(1)
    end

    it 'redirects to root_path after new object' do
       post :addfriend, params: {user_id: user, friend_id: friendtwo, status: 0}
       expect(response).to redirect_to '/'
    end
  end

  # describe '#index' do
  #   it 'should return a list of all users' do
  #     10.times { FactoryBot.create :user }
  #     get :index
  #     expect(assigns(:users).length).to eql(10)
  #   end
  # end
  #
  # describe '#show' do
  #   it 'should return the user with given id' do
  #     new_user = FactoryBot.create :user
  #     get :show, params: { id: new_user.id }
  #     expect(assigns(:user)).to eql(new_user)
  #   end
  # end
end
