class RemoveIndexEq < ActiveRecord::Migration[5.2]
  def change
    remove_index :friendships, name: "index_friendships_on_user_id_and_friend_id"
  end
end
