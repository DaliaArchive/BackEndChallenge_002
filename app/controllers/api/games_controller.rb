class Api::GamesController < ApiController
  def create
    if params[:gameId].presence && game = Game.find_by_id(params[:gameId])
      return error "Game already finished" if game.moves_player_2
      game.moves_player_2 = params[:moves]
    else
      game = Game.new(moves_player_1: params[:moves])
    end

    if game.save
      render json: { status: "created", game: GameSerializer.new(game).run }
    else
      error "Could not create or update game"
    end
  end

  def show
    game = Game.find(params[:id])
    render json: { status: "created", game: GameSerializer.new(game).run }
  rescue ActiveRecord::RecordNotFound
    not_found
  end
end
