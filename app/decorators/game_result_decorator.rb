class GameResultDecorator
  class PlayerStat < Struct.new(:uuid, :moves, :result)
    def won_moves
      @won_moves ||= result.count(true)
    end

    def moves_stat
      @moves_stat ||= moves.zip(result)
    end
  end

  attr_reader :game, :my_uuid, :my_stat, :adversary_stat

  def initialize(game, uuid)
    @game, @my_uuid = game, uuid
    init_stats
  end

  def combat_result
    my_won_moves <=> adversary_won_moves
  end

  def my_won_moves
    my_stat.won_moves
  end

  def adversary_won_moves
    adversary_stat.won_moves
  end

  def moves_stat
    my_stat.moves_stat
  end

  def adversary_moves_stat
    adversary_stat.moves_stat
  end

  def method_missing(method_name, *args, &block)
    game.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    game.respond_to?(method_name, include_private) || super
  end

  protected
  def init_stats
    stats = [
        PlayerStat.new(game.uuid, game.moves, game.owner_result),
        PlayerStat.new(game.adversary_uuid, game.adversary_moves, game.adversary_result)
    ]
    if game.uuid == my_uuid
      @my_stat, @adversary_stat = stats
    else
      @adversary_stat, @my_stat = stats
    end
  end
end