class GamesController < ApplicationController
  before_action :editable_game, only: [:edit, :update]

  def index
    @games = Game.waiting
  end

  def show
    @game = Game.find(params[:id])
    if @game.finished?
      redirect_to game_result_path(@game)
    else
      render 'show'
    end
  end

  def new
    @game = Game.new(uuid: current_uuid)
  end

  def create
    @game = Game.new(uuid: current_uuid, moves: game_param(:moves, []))
    if @game.save
      redirect_to game_path(@game), notice: "The game has been created."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    Combat.new(@game, current_uuid, game_param(:adversary_moves, [])).start!
    redirect_to game_result_path(@game)
  end

  def search
    @game = Game.search(game_param(:uuid))
    if @game.new_record?
      render template: 'home/index', alert: 'Game not found'
    else
      redirect_to edit_game_path(@game)
    end
  end

  protected
  def editable_game
    @game = Game.editable(current_uuid).find(params[:id])
  end

  def game_param(name, value=nil)
    filter = value.nil? ? name : {name => value}
    params.require(:game).permit(filter)[name]
  end

end
