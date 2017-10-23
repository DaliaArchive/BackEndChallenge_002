class GameSerializer
  def initialize(game)
    @game = game
  end

  def run
    {
      id: @game.id,
      movesPlayer1: @game.moves_player_1 || [],
      movesPlayer2: @game.moves_player_2 || [],
    }
  end
end