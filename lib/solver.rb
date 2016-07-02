class Solver
  attr_reader :board

  def initialize(board)
    @board = board.board
  end

  def row_mates(cell)
  end

  def column_mates(cell)
    mates = board.select do |element|
      element.column == cell.column
    end
    mates.map(&:value)
  end

  def square_mates(cell)
  end
end
