require 'json'
require 'Piece.rb'
class Game
  attr_accessor :board
  def initialize
    spawn_pieces
    @board=[]
    @empty='.'
    8.times{|i| @board.push([@empty, @empty, @empty, @empty, @empty, @empty, @empty, @empty])}

  end

  def spawn_pieces
    @king_p1=King.new(1)
    @queen_p1=Queen.new('Q1', 1)
    @bishop1_p1=Bishop.new('B1', 1)
    @bishop2_p1=Bishop.new('B2', 1)
    @knight1_p1=Knight.new('N1', 1)
    @knight2_p1=Knight.new('N2', 1)
    @rook1_p1=Rook.new('R1', 1)
    @rook2_p1=Rook.new('R2', 1)
    @pawn1_p1=Pawn.new('P1', 1)
    @pawn2_p1=Pawn.new('P2', 1)
    @pawn3_p1=Pawn.new('P3', 1)
    @pawn4_p1=Pawn.new('P4', 1)
    @pawn5_p1=Pawn.new('P5', 1)
    @pawn6_p1=Pawn.new('P6', 1)
    @pawn7_p1=Pawn.new('P7', 1)
    @pawn8_p1=Pawn.new('P8', 1)
    #player 2
    @king_p2=King.new(2)
    @queen_p2=Queen.new('Q1', 2)
    @bishop2_p2=Bishop.new('B1', 2)
    @bishop2_p2=Bishop.new('B2', 2)
    @knight1_p2=Knight.new('N1', 2)
    @knight2_p2=Knight.new('N2', 2)
    @rook1_p2=Rook.new('R1', 2)
    @rook2_p2=Rook.new('R2', 2)
    @pawn1_p2=Pawn.new('P1', 2)
    @pawn2_p2=Pawn.new('P2', 2)
    @pawn3_p2=Pawn.new('P3', 2)
    @pawn4_p2=Pawn.new('P4', 2)
    @pawn5_p2=Pawn.new('P5', 2)
    @pawn6_p2=Pawn.new('P6', 2)
    @pawn7_p2=Pawn.new('P7', 2)
    @pawn8_p2=Pawn.new('P8', 2)
  end
end
