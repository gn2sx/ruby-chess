require_relative 'Game.rb'
require 'json'
#require_relative 'Piece.rb'

game=Game.new

game.board.each do |i|
  print game.board[i]
  puts ' '
end
