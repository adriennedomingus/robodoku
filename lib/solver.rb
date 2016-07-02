class Solver
  attr_reader :board

  def initialize(board)
    @board = board.board
  end

  def row_mates(cell)
    mates(cell, "row")
  end

  def column_mates(cell)
    mates(cell, "column")
  end

  def square_mates(cell)
    mates(cell, "square")
  end

  private
    def mates(cell, type)
      mates = board.select do |element|
        element.send(type) == cell.send(type)
      end
      mates.map(&:value)
    end
end
