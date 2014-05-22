class AddDimentionToGames < ActiveRecord::Migration
  def change
    add_column :games, :dimension, :integer
  end
end
