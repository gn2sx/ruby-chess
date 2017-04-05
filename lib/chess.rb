require_relative 'Game.rb'
require 'json'
require 'colorize'
require_relative 'Piece.rb'

game=Game.new
game.move(1,'R1',['A',3])
game.remove(1,'P1')
game.move(1,'R1',['A',7])
game.draw_board
