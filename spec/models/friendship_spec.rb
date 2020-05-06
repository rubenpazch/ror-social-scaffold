require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation tests' do    
    before :each do
      @user = users(:first)
      @event = @user.events_as_creator.build(description: 'The first event', event_date: Time.now)
    end

    it 'should not be valid if event creator is not present' do
      expect(@event).to_not be_valid
    end

    it 'description should be present' do
      @event.description = '   '
      expect(@event).to_not be_valid
    end

    it 'location should be present' do
      @event.location = '   '
      expect(@event).to_not be_valid
    end

    it 'event_date should be present' do
      @event.event_date = nil
      expect(@event).to_not be_valid
    end

    it 'creator_id should be present' do
      @event.creator_id = nil
      expect(@event).to_not be_valid
    end
  end

  context 'association tests' do
    describe 'event model associations' do
      it 'belongs to host' do
        assc = Event.reflect_on_association(:creator)
        expect(assc.macro).to eq :belongs_to
      end
      it 'has many invites' do
        assc = Event.reflect_on_association(:attendances)
        expect(assc.macro).to eq :has_many
      end
      it 'has many guests' do
        assc = Event.reflect_on_association(:guests)
        expect(assc.macro).to eq :has_many
      end
    end
  end
end
