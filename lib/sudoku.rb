require_relative 'board'
require_relative 'solver'

input = File.read(ARGV[0])
board = Board.new(input)
solver = Solver.new(board)
solution = solver.solution
puts solution
