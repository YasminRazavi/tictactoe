class User < ActiveRecord::Base
  attr_accessible :age, :email, :image, :name, :password, :password_confirmation
  has_secure_password
  has_many :moves
  has_many :games, through: :moves, :class_name=> "Game", :foreign_key => "game_id"


  def self.number_wins    
    users = User.all 
    @result_board = []
      users.each do |user|
        wins = user.user_wins
        @result_board << [user.id, wins, user.games.count]
      end
    @result_board.sort! {|a,b| b[1] <=> a[1]}
  end


  def user_wins 
    wins=0  
    games.each do |game| 
    if game.result.uniq.first == id
      wins +=1
      end
    end
    wins
  end
end
