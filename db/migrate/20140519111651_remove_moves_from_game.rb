class RemoveMovesFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :moves

  end
end
