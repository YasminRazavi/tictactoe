class AddMovesNoToGame < ActiveRecord::Migration
  def change
    add_column  :games, :moves_no, :integer
  end
end
