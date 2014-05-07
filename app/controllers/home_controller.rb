class HomeController < ApplicationController
  before_action :check_game_assignment, only: :index

  def index
    @game = Game.new
  end

  private
  def check_game_assignment
    @game = Game.assigned_to_user(current_uuid).first
    if @game
      if @game.finished?
        redirect_to game_path(@game)
      else
        redirect_to edit_game_path(@game)
      end
    end
  end
end
