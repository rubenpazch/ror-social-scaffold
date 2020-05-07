class RemoveStatusColFromFriendship < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :status
  end
end
