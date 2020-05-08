require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create :user }
  before { sign_in user }

  describe '#index' do
    it 'should return a list of all users' do
      10.times { FactoryBot.create :user }
      get :index
      expect(assigns(:users).length).to eql(10)
    end
  end

  describe '#show' do
    it 'should return the user with given id' do
      new_user = FactoryBot.create :user
      get :show, params: { id: new_user.id }
      expect(assigns(:user)).to eql(new_user)
    end
  end
end