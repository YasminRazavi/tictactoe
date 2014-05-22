class Move < ActiveRecord::Base
  attr_accessible :column, :game_id, :row, :user_id
  belongs_to :user
  belongs_to :game



end
