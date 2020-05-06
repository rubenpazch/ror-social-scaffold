class Friendship < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: {scope: :friend_id}
end
