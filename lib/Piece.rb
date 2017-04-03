require_relative 'Game.rb'
class Piece
  def initialize(type,id)
    @type=type
    @id=id

  end
end

class Knight < Piece
  def initialize(id, player)
    @type='knight'
    @id=id
    @move_style='jump'
    @player=player
  end
end

class Pawn < Piece
  @@promoted=0
  def initialize(id, player)
    @type='pawn'
    @id=id
    @move_style='charge'
    @player=player
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
  end
end

class Queen < Piece
  def initialize(id, player)
    @type='queen'
    @id=id
    @move_style='any'
    @player=player
  end
end

class Bishop < Piece
  def initialize(id, player)
    @type='bishop'
    @id=id
    @player=player
  end
end

class Rook < Piece
  def initialize(id, player)
    @type='rook'
    @id=id
    @player=player
  end
end
