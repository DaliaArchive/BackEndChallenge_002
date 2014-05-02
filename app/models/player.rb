class Player < ActiveRecord::Base
  belongs_to :game
  has_one :player_move
end
