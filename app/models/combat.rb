class Combat
  attr_reader :game
  def initialize(game, uuid, moves)
    @game = game
    game.adversary_uuid = uuid
    game.adversary_moves = moves
  end

  def start!
    game.state = :finished
    game.owner_result, game.adversary_result = calc_result
    game.save!
  end

  private
  def calc_result
    Game::MOVES_SIZE.times.inject([[], []]) do |res, i|
      comp_res = Move.new(game.moves[i]) <=> Move.new(game.adversary_moves[i])
      res.first << (comp_res == 1)
      res.last << (comp_res == -1)
      res
    end
  end

end