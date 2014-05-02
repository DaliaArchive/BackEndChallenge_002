class CreateGameActs < ActiveRecord::Migration
  def change
    create_table :game_acts do |t|
      t.string :name
      t.string :short_name
      t.timestamps
    end
  end
end
