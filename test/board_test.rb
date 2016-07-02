require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'

class BoardTest < MiniTest::Test
  def setup
    @board = Board.new(given_input)
  end

  def given_input
    "8  5 4  7\n  5 3 9\n 9 7 1 6\n1 3   2 8\n 4     5\n2 78136 4\n 3 9 2 8\n  2 7 5\n6  3 5  1\n"
  end

  def test_cells
    result = @board.board
    assert_equal(2, result[4].square)
    assert_equal(8, result[75].row)
    assert_equal(4, result[31].column)
  end

  def test_unsolved_cells
    assert_equal(46, @board.unsolved_cells.length)
  end

  def test_unsolved_cells_all_have_value_of_zero
    @board.unsolved_cells.each do |cell|
      assert(cell.value == 0)
    end
  end
end
