class GamesController < ApplicationController
 
  def index
    @games = Game.all
  end

  # Need to speak with Gerry on how to make this DRY
  def show
    @game = Game.find(params[:id])   
    if @game.moves.empty?
      @current_turn = @game.pick_first_move
      @table = @game.move_to_table
      render :show
    elsif @game.win?      
       @table = @game.move_to_table
       @result=@game.result
      render :game_over
    elsif @game.move_to_table.flatten.include? 0 
      if @game.player1 == 1
        @computer_next_move = @game.computer_next_move
        @table = @game.move_to_table
        @current_turn = @game.get_turn
          if @game.win?
             @result=@game.result
             render :game_over
          else
            render :show  
          end
      else
        @table = @game.move_to_table
        @current_turn = @game.get_turn
        render :show
      end
    else 
      @table = @game.move_to_table
      @current_turn = @game.get_turn
      @result =[]
      render :game_over
    end
  
  end

  def game_over
    @game=Game.find(params[:id])
      @table=@game.move_to_table
      @result=@game.result
      render :game_over
  end

  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  def edit
    @game = Game.find(params[:id])
  end


  def create
    player1_sign = ["X","O"].sample
    player2_sign = (["X","O"]-[player1_sign]).first
    @game = Game.create({
      player1: params[:game][:player1],
      player2: current_user.id,
      player1_sign: player1_sign,
      player2_sign: player2_sign,
      dimension: params[:game][:dimension]
    })
    redirect_to game_path(@game.id)
    
  end

  
  def update
    @game = Game.find(params[:id])
    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end


  def welcome

    render :welcome
  end
end
