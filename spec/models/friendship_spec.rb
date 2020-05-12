# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation tests' do
    before :each do
      @user1 = User.create(name: 'carlos', email: 'carlos@bar.com', password: 'foobar')
      @user2 = User.create(name: 'pedro', email: 'pedro@bar.com', password: 'fourbar')
      @user3 = User.create(name: 'jose', email: 'jose@bar.com', password: 'fourbar')
      @user3 = User.new(name: 'paul', email: 'four@bar.com', password: 'fourbar')
      @friendship1 = Friendship.new(user_id: @user1.id, friend_id: @user2.id)
      @friendship2 = Friendship.new(user_id: @user1.id, friend_id: @user3.id)
    end
    context 'validation tests' do
      describe 'for friendships' do
        it 'has to have a friend_id' do
          expect(@friendship1.friend_id).to eq(@user2.id)
        end

        it 'is not valid without user_id' do
          @friendship1.user_id = nil
          expect(@friendship1).to_not be_valid
        end

        it 'is not valid without friend_id' do
          @friendship1.friend_id = nil
          expect(@friendship1).to_not be_valid
        end

        it 'is not valid if the requested friend doesnt exist' do
          @friendship1.friend_id = @user3.id
          expect(@friendship1).to_not be_valid
        end

        it 'returns an error for missing friend_id' do
          @friendship1.friend_id = nil
          expect(@friendship1.save).to eq(false)
        end
      end
    end
  end

  context 'association tests' do
    describe 'friendship model associations' do
      it 'belongs to user' do
        assc = Friendship.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
