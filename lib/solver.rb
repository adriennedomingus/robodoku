class Solver
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def row_mates(cell)
    section_mates(cell, "row")
  end

  def column_mates(cell)
    section_mates(cell, "column")
  end

  def square_mates(cell)
    section_mates(cell, "square")
  end

  def possible_cell_values(cell)
    possibilities = all_possibliities
    all_mate_values(cell).each do |mate|
      possibilities.delete(mate)
    end
    possibilities
  end

  def solve
    until board.solved?
      board.board.each do |cell|
        solve_for_cell(cell)
      end
    end
    board
  end

  def solution
    solve.board.map(&:value).join.scan(/.{9}/).join("\n")
  end

  private
    def section_mates(cell, type)
      mates = board.board.select do |element|
        element.send(type) == cell.send(type)
      end
      mates.map(&:value)
    end

    def all_mate_values(cell)
      [square_mates(cell), column_mates(cell), row_mates(cell)].flatten.uniq
    end

    def all_possibliities
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def solve_for_cell(cell)
      if cell.unsolved? && possible_cell_values(cell).length == 1
        cell.value = possible_cell_values(cell)[0]
      end
    end
end
