class Sudoku
  def initialize

  end
end

if __FILE__ == $0
  input = File.read(ARGV[0])
  board = Board.new(input)
  solver = Solver.new(board)
  solution = solver.solve(board)
  puts solution
end
