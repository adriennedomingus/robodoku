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

  def test_rows
    result = [[8, 0, 0, 5, 0, 4, 0, 0, 7],
              [0, 0, 5, 0, 3, 0, 9, 0, 0],
              [0, 9, 0, 7, 0, 1, 0, 6, 0],
              [1, 0, 3, 0, 0, 0, 2, 0, 8],
              [0, 4, 0, 0, 0, 0, 0, 5, 0],
              [2, 0, 7, 8, 1, 3, 6, 0, 4],
              [0, 3, 0, 9, 0, 2, 0, 8, 0],
              [0, 0, 2, 0, 7, 0, 5, 0, 0],
              [6, 0, 0, 3, 0, 5, 0, 0, 1]]
    assert_equal(result, @board.rows)
  end

  def test_columns
    result = [[8, 0, 0, 1, 0, 2, 0, 0, 6],
              [0, 0, 9, 0, 4, 0, 3, 0, 0],
              [0, 5, 0, 3, 0, 7, 0, 2, 0],
              [5, 0, 7, 0, 0, 8, 9, 0, 3],
              [0, 3, 0, 0, 0, 1, 0, 7, 0],
              [4, 0, 1, 0, 0, 3, 2, 0, 5],
              [0, 9, 0, 2, 0, 6, 0, 5, 0],
              [0, 0, 6, 0, 5, 0, 8, 0, 0],
              [7, 0, 0, 8, 0, 4, 0, 0, 1]]
    assert_equal(result, @board.columns)
  end
end
