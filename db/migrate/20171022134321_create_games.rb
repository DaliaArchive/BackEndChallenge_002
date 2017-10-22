class CreateGames < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TYPE choice_type AS ENUM ('rock', 'paper', 'scissors', 'spock', 'lizard');
    SQL

    create_table :games, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.timestamps
    end

    add_column :games, :moves_player_1, :choice_type, array: true, null: false
    add_column :games, :moves_player_2, :choice_type, array: true
  end

  def down
    drop_table :games

    execute <<-SQL
      DROP TYPE choice_type;
    SQL
  end
end
