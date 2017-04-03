require 'json'
require_relative 'Piece.rb'
require 'colorize'
class Game
  attr_accessor :board,:p1_pieces,:p2_pieces
  def initialize
    spawn_pieces
    @board=[]
    @empty='..'
    8.times{|i| @board.push([@empty, @empty, @empty, @empty, @empty, @empty, @empty, @empty])}
    @board[0]=[@rook1_p2.id,@knight1_p2.id,@bishop1_p2.id,@king_p2.id,@queen_p2.id,@bishop2_p2.id,@knight2_p2.id,@rook2_p2.id]
    @board[1]=[@pawn1_p2.id,@pawn2_p2.id,@pawn3_p2.id,@pawn4_p2.id,@pawn5_p2.id,@pawn6_p2.id,@pawn7_p2.id,@pawn8_p2.id]
    @board[-1]=[@rook1_p1.id,@knight1_p1.id,@bishop1_p1.id,@king_p1.id,@queen_p1.id,@bishop1_p1.id,@knight2_p1.id,@rook2_p1.id]
    @board[-2]=[@pawn1_p1.id,@pawn2_p1.id,@pawn3_p1.id,@pawn4_p1.id,@pawn5_p1.id,@pawn6_p1.id,@pawn7_p1.id,@pawn8_p1.id]
  end

  def spawn_pieces
    #player 1
    @p1_pieces=Hash.new
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
    #hash refrences
    @p1_pieces['K1']=@king_p1
    @p1_pieces['Q1']=@queen_p1
    @p1_pieces['B1']=@bishop1_p1
    @p1_pieces['B2']=@bishop2_p1
    @p1_pieces['N1']=@knight1_p1
    @p1_pieces['N2']=@knight2_p1
    @p1_pieces['R1']=@rook1_p1
    @p1_pieces['R2']=@rook2_p1
    @p1_pieces['P1']=@pawn1_p1
    @p1_pieces['P2']=@pawn2_p1
    @p1_pieces['P3']=@pawn3_p1
    @p1_pieces['P4']=@pawn4_p1
    @p1_pieces['P5']=@pawn5_p1
    @p1_pieces['P6']=@pawn6_p1
    @p1_pieces['P7']=@pawn7_p1
    @p1_pieces['P8']=@pawn8_p1
    #player 2
    @p2_pieces=Hash.new
    @king_p2=King.new(2)
    @queen_p2=Queen.new('Q1', 2)
    @bishop1_p2=Bishop.new('B1', 2)
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
    #hash refrences
    @p2_pieces['K1']=@king_p2
    @p2_pieces['Q1']=@queen_p2
    @p2_pieces['B1']=@bishop2_p2
    @p2_pieces['B2']=@bishop2_p2
    @p2_pieces['N1']=@knight1_p2
    @p2_pieces['N2']=@knight2_p2
    @p2_pieces['R1']=@rook1_p2
    @p2_pieces['R2']=@rook2_p2
    @p2_pieces['P1']=@pawn1_p2
    @p2_pieces['P2']=@pawn1_p2
    @p2_pieces['P3']=@pawn1_p2
    @p2_pieces['P4']=@pawn1_p2
    @p2_pieces['P5']=@pawn1_p2
    @p2_pieces['P6']=@pawn1_p2
    @p2_pieces['P7']=@pawn1_p2
    @p2_pieces['P8']=@pawn1_p2
  end

  def draw_board
    row=8
    @board.each_with_index do |v,i|
      puts "#{row} #{@board[i].join("|")}"
      row-=1
    end
    puts "  A  B  C  D  E  F  G  H "
  end

  def move(player, piece_id)
    player=1
    piece_id='R1'
    if player==1
      piece=@p1_pieces[piece_id]
    elsif player==2
      piece=@p2_pieces[piece_id]
    end
    piece.legal?(['A',1],['A',3]) do |c|
      if c==c.colorize(:white).on_black
        return 1
      elsif c==c.colorize(:black).on_white
        return 2
      else
        return nul
    end
  end

  def convert(coords) #converts board coordinates to array coordinates
    row_converts=Hash[8,0,7,1,6,2,5,3,4,4,3,5,2,6,1,7]
    column_converts=Hash['A',0,'B',1,'C',2,'D',3,'E',4,'F',5,'G',6,'H',7]
    coords[0]=coords[0].upcase
    coords[1]=coords[1].to_i
    row=row_converts[coords[1]]
    column=column_converts[coords[0]]
    return [row,coulmn]
  end

end end
