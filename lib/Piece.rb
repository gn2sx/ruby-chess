require_relative 'Game.rb'
require 'colorize'
class Piece
  attr_accessor :id
  def initialize(type,id,player)
    @type=type
    @id=id
    @player=player
    set_color
  end

  def set_color
    if @player==1
      @id=id.colorize(:white)
    elsif @player==2
      @id=id.colorize(:cyan)
    end
  end
end

class Knight < Piece

  def initialize(id, player)
    @type='knight'
    @id=id
    @move_style='jump'
    @player=player
    set_color
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
  end
end

class Queen < Piece
  def initialize(id, player)
    @type='queen'
    @id=id
    @move_style='any'
    @player=player
    set_color
  end
end

class Bishop < Piece
  def initialize(id, player)
    @type='bishop'
    @id=id
    @player=player
    set_color
  end
end

class Rook < Piece
  def initialize(id, player)
    @type='rook'
    @id=id
    @player=player
    set_color
  end
end
