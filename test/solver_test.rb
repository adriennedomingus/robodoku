require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solver'
require_relative '../lib/board'

class SolverTest < MiniTest::Test

  def setup
    board = Board.new(given_input)
    @solver = Solver.new(board)
  end

  def given_input
    "8  5 4  7\n  5 3 9\n 9 7 1 6\n1 3   2 8\n 4     5\n2 78136 4\n 3 9 2 8\n  2 7 5\n6  3 5  1\n"
  end

  def test_cell_mates
  end
end
