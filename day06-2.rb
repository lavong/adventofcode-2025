#!/usr/bin/env ruby

input = File.read(File.expand_path("../day06.txt", __FILE__))

grid = input.split("\n").map { |line| line.chars }

grand_total = 0
op = grid[-1][0]
block_start_x = 0
(0..grid[0].length).each { |x|
  op = grid[-1][x] if %w[* +].include? grid[-1][x]
  block_end = (0...grid.length).none? { |y| x < grid[y].length && grid[y][x] != ' ' }

  if block_end
    total = op == '*' ? 1 : 0
    (block_start_x...x).each { |dx|
      n = (0...(grid.length - 1)).map { grid[_1][dx] }.select { _1 != ' ' }.join.to_i
      op == '*' ? total *= n : total += n
    }
    block_start_x = x + 1
    grand_total += total
  end
}

puts "solution part 2: #{grand_total}"
