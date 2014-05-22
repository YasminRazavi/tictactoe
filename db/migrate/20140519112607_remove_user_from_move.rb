class RemoveUserFromMove < ActiveRecord::Migration
  def change
    remove_column :moves, :user
     remove_column :moves, :game
  end
end
