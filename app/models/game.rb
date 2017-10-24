class Game < ApplicationRecord
  enum choice_type: {
    rock: 'rock',
    paper: 'paper',
    scissors: 'scissors',
    spock: 'spock',
    lizard: 'lizard',
  }

  def switch!
    self.moves_player_2, self.moves_player_1 = self.moves_player_1, self.moves_player_2
    true
  end
end
