require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cell'

class CellTest < MiniTest::Test
  def test_cell_is_unsolved
    cell = Cell.new(0, 2, 9)
    assert(cell.unsolved?)
  end

  def test_cell_is_solved
    cell = Cell.new(3, 2, 9)
    refute(cell.unsolved?)
  end
end
