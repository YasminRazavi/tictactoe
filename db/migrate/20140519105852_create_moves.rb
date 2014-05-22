class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :user
      t.integer :game
      t.string :column
      t.string :row

      t.timestamps
    end
  end
end
