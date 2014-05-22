class Game < ActiveRecord::Base
  attr_accessible :moves_no, :player1, :player2, :winner, :player1_sign, :player2_sign, :dimension
  has_many :moves
  has_many :users, through: :moves, foreign_key: "user_id"
  
  def computer_next_move   
    if player1==1
      if self.moves.last.user_id == player2
        row_col = self.logic_next_move
          move = self.moves.create(user_id:player1, column:row_col[1] , row:row_col[0] )
          puts row_col  
      end
    end   
  end


  def pick_first_move
    first_player = [player1,player2].sample
    if first_player == 1
      row_col = self.logic_next_move
      move = self.moves.create(user_id:player1, column:row_col[1] , row:row_col[0] )
      current_turn = player2
    else
      first_player
    end
  end

  def logic_next_move
    table = self.move_to_table
    i= 0
    j= 0  
    while table[i][j]!=0 do
      i = (0..(dimension-1)).to_a.sample
      j = (0..(dimension-1)).to_a.sample
    end
    return [i, j]
  end

  def move_to_table
    moves_so_far = moves
    table=[]   
   
    (0...(dimension)).each do
      row = []
      (0...(dimension)).each do
        row << 0
      end
      table << row
    end      
    moves.each do |move|
      table[move.row.to_i][move.column.to_i] = move.user_id
    end
    return table
  end
  

  def get_turn
      last_player = moves.last.user_id
      # Ask Gerry how to make shorter as this is probs dumb
      if last_player == player1
        current_turn  = player2
      else
        current_turn = player1
      end  
  end


  def game_status
      table = self.move_to_table
      game_status = []
      game_column = []
      game_cross = []
      game_reverse_cross = []
      (0..(dimension-1)).each do |row| 
        game_status << table[row]
      end
   
      (0..(dimension-1)).each do |column|
        (0..(dimension-1)).each do |row|
          game_column << table[row][column]
        end
        game_status << game_column
        game_column = []
      end

      (0..(dimension-1)).each do |index|
        game_cross << table[index][index]
      end
      game_status << game_cross

      (0..(dimension-1)).each do |i|
        game_reverse_cross <<table[(dimension-1)-i][i]
      end
           
      game_status <<  game_reverse_cross

      return game_status
  end




  def result
    gamestatus = self.game_status
    result = []
    gamestatus.each do |i|
       if i.uniq.length == 1 
        if  i.uniq.first!=0
          result = i
        end
      end
    end
    result
  end


  def win?
    !(self.result==[])
  end

end

  