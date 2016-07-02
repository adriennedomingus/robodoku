require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'

class BoardTest < MiniTest::Test
  def setup
    @board = Board.new(given_input)
    @solved_board = Board.new(solved_input)
  end

  def given_input
    "8  5 4  7\n  5 3 9\n 9 7 1 6\n1 3   2 8\n 4     5\n2 78136 4\n 3 9 2 8\n  2 7 5\n6  3 5  1\n"
  end

  def solved_input
  "826594317\n715638942\n394721865\n163459278\n948267153\n257813694\n531942786\n482176539\n679385421\n"
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

  def test_whole_board_is_not_solved
    refute @board.solved?
  end

  def test_whole_board_is_solved
    assert @solved_board.solved?
  end
end
