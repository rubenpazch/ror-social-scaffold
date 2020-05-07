class Friendship < ApplicationRecord
  belongs_to :user
  validates :friend_id, :user_id, presence: true
end
