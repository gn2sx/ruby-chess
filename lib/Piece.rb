require_relative 'Game.rb'
require 'colorize'
class Piece
  attr_accessor :id
  def initialize(type,id,player)
    @type=type
    @id=id
    @player=player
    @alive=true
    set_color
  end

  def set_color
    if @player==1
      @id=id.colorize(:white).on_black
    elsif @player==2
      @id=id.colorize(:black).on_white
    end
  end

  def alive?
    return @alive
  end

  def convert(coords) #converts board coordinates to array coordinates
    row_converts=Hash[8,0,7,1,6,2,5,3,4,4,3,5,2,6,1,7]
    column_converts=Hash['A',0,'B',1,'C',2,'D',3,'E',4,'F',5,'G',6,'H',7]
    coords[0]=coords[0].upcase
    coords[1]=coords[1].to_i
    row=row_converts[coords[1]]
    column=column_converts[coords[0]]
    return [row,column]
  end
end

class Knight < Piece

  def initialize(id, player)
    @type='knight'
    @id=id
    @move_style='jump'
    @player=player
    set_color
    @alive=true
  end
end

class Pawn < Piece
  @@promoted=0
  def initialize(id, player)
    @type='pawn'
    @id=id
    @move_style='charge'
    @player=player
    set_color
    @alive=true
    @first_move=true
  end

  def first_move?
    return @first_move
  end

  def promote(new_type)

  end
end

class King < Piece
  def initialize(player) #There can only ever be one king
    @type='king'
    @id='KI'
    @move_style='any'
    @player=player
    set_color
    @alive=true
  end
end

class Queen < Piece
  def initialize(id, player)
    @type='queen'
    @id=id
    @move_style='any'
    @player=player
    set_color
    @alive=true
  end
end

class Bishop < Piece
  def initialize(id, player)
    @type='bishop'
    @id=id
    @player=player
    set_color
    @alive=true
  end
end

class Rook < Piece
  def initialize(id, player)
    @type='rook'
    @id=id
    @player=player
    set_color
    @alive=true
  end

  def legal?(current, target, board, empty='  ')
    current_row=current[0]
    current_column=current[1]
    target=convert(target)
    target_row=target[0]
    target_column=target[1]
    target_contents=board[target_row][target_column]
    #target_player=yield(target_contents)
    if target_contents==target_contents.colorize(:white).on_black
      target_player=1
    elsif target_contents==target_contents.colorize(:black).on_white
      target_player=2
    else
      target_player=nil
    end
    #board[target_row][target_column].uncolorize
    if current==target
      puts "Illegal move: The #{@type} is already on that space."
      return false
    elsif !target_row.between?(0,7)||!target_column.between?(0,7)
      puts "Illegal move: The given square does not exist."
      return false
    elsif current_row!=target_row&&current_column!=target_column
      puts "Illegal move: Rooks must move in a streight line, horizontally or vertically."
      return false
    elsif target_contents!=empty&&target_player==@player
      puts "Illegal move: Space is occupied by your #{target_contents}"
      return false
    end
    diff=current_row-target_row
    horiz=false
    if diff==0
      diff=target_column-current_column
      horiz=true
    end
    blocked=false
    diff.abs.times do |i|
      break if diff.abs==i
      next if i==0
      if diff<0&&horiz
        blocked=true unless board[current_row][current_column+i]==empty
      elsif diff>0&&horiz
        blocked=true unless board[current_row][current_column-i]==empty
      elsif diff<0&&!horiz
        blocked=true unless board[current_row+i][current_column]==empty
      elsif diff>0&&!horiz
        blocked=true unless board[current_row-i][current_column]==empty
      end
      break if blocked
    end
    if blocked
      puts "Illegal move: Path is obstructed by another piece"
      return false
    else
      return true
    end
  end
end
