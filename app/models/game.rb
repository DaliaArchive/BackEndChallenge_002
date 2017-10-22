class Game < ApplicationRecord
  enum choice_type: {
    rock: 'rock',
    paper: 'paper',
    scissors: 'scissors',
    spock: 'spock',
    lizard: 'lizard',
  }
end
