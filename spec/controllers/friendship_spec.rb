require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
    let(:user) { FactoryBot.create :user }
    before { sign_in user }
    
    describe '#new' do
        it 'should initialize empty friendship' do
          get :new, params: { id: user.id }
          expect(user.friendships.empty?).to eql(true)
        end
    end

    describe '#accept' do
      it 'should initialize empty friendship index' do
        post :accept, params: { id: user.id }
        expect(user.friendships.empty?).to eql(true)
      end
    end
end