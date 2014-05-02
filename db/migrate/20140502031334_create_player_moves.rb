class CreatePlayerMoves < ActiveRecord::Migration
  def change
    create_table :player_moves do |t|
      t.belongs_to :player
      t.string :moves
      t.timestamps
    end
  end
end
