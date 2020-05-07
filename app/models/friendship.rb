class Friendship < ApplicationRecord
  belongs_to :user
  # rubocop: disable Layout/LineLength
  # validates :friend_id, :user_id, uniqueness: { scope: %i[friend_id user_id], message: 'The invitation was already sent!' }
  # rubocop: enable Layout/LineLength
end
