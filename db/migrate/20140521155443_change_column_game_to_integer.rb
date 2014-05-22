class ChangeColumnGameToInteger < ActiveRecord::Migration
  def change
    change_column :games, :player1_sign, :string
    change_column :games, :player2_sign, :string
  end
  
end
