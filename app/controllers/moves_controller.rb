class MovesController < ApplicationController
  # GET /moves
  # GET /moves.json
  def index
    @moves = Move.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moves }
    end
  end

  # GET /moves/1
  # GET /moves/1.json
  def show
    @move = Move.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/new
  # GET /moves/new.json
  



  def new
  game = Game.find(params[:game_id])
  
  move = game.moves.new({
    column: params[:column],
    row: params[:row],
    user_id: params[:user_id]
    })
  move.save
  redirect_to "/games/#{params[:game_id]}"

  end

  # GET /moves/1/edit
  def edit
    @move = Move.find(params[:id])
  end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(params[:move])
  end

  # PUT /moves/1
  # PUT /moves/1.json
  def update
    @move = Move.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        format.html { redirect_to @move, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
    @move = Move.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.html { redirect_to moves_url }
      format.json { head :no_content }
    end
  end
end
