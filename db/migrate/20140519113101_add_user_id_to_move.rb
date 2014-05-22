class AddUserIdToMove < ActiveRecord::Migration
    def change
    add_column :moves, :user_id, :integer
    add_column :moves, :game_id, :integer
  end
end
