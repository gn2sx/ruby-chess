require_relative 'Game.rb'
require 'json'
#require_relative 'Piece.rb'

game=Game.new

game.board.each_with_index do |v,i|
  print game.board[i]
  puts ' '
end
