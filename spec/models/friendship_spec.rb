require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation tests' do
    before :each do
      # @user = users(:first)
      @friendship = Friendship.new(user_id: 1, friend_id: 2, status: 0)
    end

    it 'should not be valid if friendship creator is not present' do
      expect(@friendship).to_not be_valid
    end

    it 'status should be present' do
      @friendship.status = '   '
      expect(@friendship).to_not be_valid
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
