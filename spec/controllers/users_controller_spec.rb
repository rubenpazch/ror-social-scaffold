# rubocop:disable Layout/LineLength

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:user2) { FactoryBot.create :user }
  let(:friendship1) { FactoryBot.create :friendship }

  before { sign_in user }
  before { sign_in user2 }

  describe '#index' do
    it 'should return a list of all users' do
      1.upto(10) do
        FactoryBot.create :user
      end
      get :index
      expect(assigns(:users).length).to eql(12)
    end
  end

  describe '#show' do
    it 'should return the user with given id' do
      new_user = FactoryBot.create :user
      get :show, params: { id: new_user.id }
      expect(assigns(:user)).to eql(new_user)
    end
  end

  describe '#index' do
    subject { get :index }
    it 'render the template' do
      expect(subject).to render_template(:index)
      expect(subject).to render_template('index')
      expect(subject).to render_template('users/index')
    end

    it 'does not render a different template' do
      expect(subject).to_not render_template('users/delete')
    end
  end

  describe '#addfriend' do
    subject { post :addfriend, params: { friendship: { user_id: friendship1.user_id, friend_id: friendship1.friend_id, status: 1 } } }

    it 'redirects to users_url' do
      expect(subject).to redirect_to(users_url(assigns(:friendship)))
    end

    it 'redirects to root_url' do
      post :addfriend, params: { user_id: user, friend_id: user2, status: 0 }
      expect(response).to redirect_to root_url
    end

    it 'returns http success' do
      expect { put :addfriend, params: { friend: { user_id: friendship1.user_id, friend_id: friendship1.friend_id, status: 1 } } }.to change(Friendship, :count).by(1)
    end
  end
end
# rubocop:enable Layout/LineLength
