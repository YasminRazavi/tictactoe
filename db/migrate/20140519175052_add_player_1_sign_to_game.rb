class AddPlayer1SignToGame < ActiveRecord::Migration
  def change
    add_column :games, :player1_sign, :integer
     add_column :games, :player2_sign, :integer
  end
end
