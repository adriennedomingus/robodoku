require_relative './cell'

class Board
  attr_reader :board

  def initialize(input)
    @board = create_cells(input)
  end

  def create_cells(input)
    board = rows(input).map.with_index do |row, row_index|
      row = row.map.with_index do |element, element_index|
        Cell.new(element, row_index, element_index)
      end
    end
    board.flatten
  end

  def unsolved_cells
    @board.select do |cell|
      cell.unsolved?
    end
  end

  private

    def rows(input)
      rows = input.split("\n").map(&:chars)
      rows.each do |row|
        row.map!(&:to_i)
        fill_in_row(row)
      end
    end

    def fill_in_row(row)
      until row.length == 9
        row << 0
      end
    end
end
