class Cell
  attr_reader :value, :row, :column, :square

  def initialize(value, row_index, element_index)
    @value = value
    @row = row_index
    @column = element_index
    @square = square_number(row_index, element_index)
  end

  private

    def square_number(row_index, element_index)
      row_index/3 * 3 + 1 + element_index/3
    end
end
