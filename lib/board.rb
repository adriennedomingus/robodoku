class Board
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def rows
    rows = input.split("\n").map(&:chars)
    rows.each do |row|
      row.map!(&:to_i)
      fill_in_row(row)
    end
  end

  def columns
    rows.transpose
  end

  private

    def fill_in_row(row)
      until row.length == 9
        row << 0
      end
    end
end
