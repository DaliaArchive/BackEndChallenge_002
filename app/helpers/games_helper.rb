module GamesHelper
  def my_moves(game)
    if current_uuid == game.uuid
      game.moves
    elsif current_uuid == game.adversary_uuid
      game.adversary_moves
    end
  end

  def submit_title(action)
    action == :edit ? 'Fight!' : 'Create'
  end
end