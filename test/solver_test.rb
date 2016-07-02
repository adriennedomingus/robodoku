require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solver'
require_relative '../lib/board'

class SolverTest < MiniTest::Test

  def setup
    board = Board.new(given_input)
    @solved_board_values = Board.new(solved_input).board.map(&:value)
    @solver = Solver.new(board)
  end

  def given_input
    "8  5 4  7\n  5 3 9\n 9 7 1 6\n1 3   2 8\n 4     5\n2 78136 4\n 3 9 2 8\n  2 7 5\n6  3 5  1\n"
    # [8, 0, 0, 5, 0, 4, 0, 0, 7,
    #  0, 0, 5, 0, 3, 0, 9, 0, 0,
    #  0, 9, 0, 7, 0, 1, 0, 6, 0,
    #  1, 0, 3, 0, 0, 0, 2, 0, 8,
    #  0, 4, 0, 0, 0, 0, 0, 5, 0,
    #  2, 0, 7, 8, 1, 3, 6, 0, 4,
    #  0, 3, 0, 9, 0, 2, 0, 8, 0,
    #  0, 0, 2, 0, 7, 0, 5, 0, 0,
    #  6, 0, 0, 3, 0, 5, 0, 0, 1]
  end

  def solved_input
    "826594317\n715638942\n394721865\n163459278\n948267153\n257813694\n531942786\n482176539\n679385421\n"
  end

  def test_column_mates
    result = [7, 0, 0, 8, 0, 4, 0, 0, 1]
    assert_equal(result, @solver.column_mates(@solver.board.board[17]))
  end

  def test_row_mates
    result = [6, 0, 0, 3, 0, 5, 0, 0, 1]
    assert_equal(result, @solver.row_mates(@solver.board.board[72]))
  end

  def test_square_mates
    result = [5, 0, 4, 0, 3, 0, 7, 0, 1]
    assert_equal(result, @solver.square_mates(@solver.board.board[3]))
  end

  def test_possible_values
    result = [4, 7]
    assert_equal(result, @solver.possible_cell_values(@solver.board.board[9]))
  end

  def test_solves_board
    result = @solver.solve.board.map(&:value)
    assert_equal(result, @solved_board_values)
  end
end
