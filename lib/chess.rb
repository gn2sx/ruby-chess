require_relative 'Game.rb'
require 'json'
require 'colorize'
require_relative 'Piece.rb'

game=Game.new
game.remove(1,'P4')
game.move(1,'KI',['D',3])
game.draw_board
