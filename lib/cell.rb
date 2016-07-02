require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cell'

class Cell
  attr_accessor :value
  attr_reader :row, :column, :square

  def initialize(value, row_index, element_index)
    @value = value
    @row = row_index
    @column = element_index
    @square = square_number(row_index, element_index)
  end

  def unsolved?
    value == 0
  end

  private

    def square_number(row_index, element_index)
      row_index/3 * 3 + 1 + element_index/3
    end
end
