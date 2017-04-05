require_relative 'Game.rb'
require 'json'
require 'colorize'
require_relative 'Piece.rb'

game=Game.new
game.move(1,'P2',['B',4])
game.remove(1,'P4')
game.move(1,'B1',['E',3])
game.draw_board
