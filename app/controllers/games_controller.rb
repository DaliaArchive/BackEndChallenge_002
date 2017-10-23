class GamesController < ApplicationController
  def new
  end

  def show
    @game = Game.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    return render plain: "Not found"
  end
end
