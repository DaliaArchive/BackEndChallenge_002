class GameController < ApplicationController
  require 'net/http'
  def index
  end
  def new
    @game = Game.new(:name => SecureRandom.hex(10))
  end
  def create
    #specify whether user is waiting for adversary?
    is_waiting = true
    if params[:adversary_game].blank?
      obj_params = params.require(:game).permit(:name)
      @game = Game.new(obj_params)
      @game.save
    else
      @game = Game.find_by_name(params[:adversary_game])
      is_waiting = false
    end
    if !@game.nil?
      @player = Player.create(:name => SecureRandom.hex(10), :game_id => @game.id)
      @moves = PlayerMove.create(:moves => params[:player_moves], :player_id => @player.id)
      redirect_to game_path(@game, :is_waiting => is_waiting, :player_id => @player.id)
    else
      flash[:message] = "This game #{params[:adversary_game]} is not valid!"
      redirect_to :action => "new"
    end
  end
  def show
    @game = Game.find(params[:id])
    @current_player = Player.find(params[:player_id])
    
    @current_player_moves = @current_player.player_move.moves
    @current_player_moves_arr = @current_player_moves.split(",")
    @adversary = @game.players.where.not(:id => params[:player_id]).first
    
    @adversary_moves = nil
    if @adversary
      @adversary_moves = @adversary.player_move.moves
      @adversary_moves_arr = @adversary_moves.split(",")
      @result = []
      @current_player_moves_arr.each_with_index do |move, index|
        puts "move == #{move}"
        puts "other half == #{@adversary_moves_arr[index]}"
        
        puts "value of kye == #{move}#{@adversary_moves_arr[index]}"
        
        puts "value of mapping == "+GAME_RULE["#{move}#{@adversary_moves_arr[index]}"]
        @result << GAME_RULE["#{move}#{@adversary_moves_arr[index]}"]
      end
      puts "**"
      puts "**"
      puts "**"
      puts "**"
      puts "**"
      puts "**"
      puts "**"
      puts "**"
      puts "**v = "
      puts "**v = #{@result}"

      win = @result.select {|p| p == "W"}
      loose = @result.select {|p| p == "L"}
      
      #NOTE: status==true, then  adversary loose
      @status = true if win.size > loose.size

      message = {
        :channel => "/game/#{@game.id}/combat",
        :ext => {:auth_token => FAYE_TOKEN},
        :data => {
          :adversary_moves => @current_player_moves_arr,
          :waiter_moves => @adversary_moves_arr,
          :result => @result,
          :status => !@status
        }
      }
      
      uri = URI.parse("#{FAYE_PATH[:url]}/faye")
      Net::HTTP.post_form(uri, :message => message.to_json)
    end
    if @game 
      js :game_id => @game.id, :type => params[:is_waiting], :faye_path => "#{FAYE_PATH[:url]}/faye"#, :player => @player.name
    else
      redirect_to :action => "new"
    end
  end
end
