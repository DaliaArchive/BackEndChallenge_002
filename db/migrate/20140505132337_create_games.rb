class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :uuid, null: false
      t.string :adversary_uuid, index: true
      t.integer :state, null: false, default: 0
      t.string :moves, array: true, default: [], null: false
      t.string :adversary_moves, array: true, default: [], null: false
      t.boolean :owner_result, array: true, default: [], null: false
      t.boolean :adversary_result, array: true, default: [], null: false

      t.timestamps
    end
    add_index :games, :uuid, unique: true
  end
end
