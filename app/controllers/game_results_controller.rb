class GameResultsController < ApplicationController
  def show
    game = Game.find(params[:id])
    @game_result = GameResultDecorator.new(game, current_uuid)
  end
end
