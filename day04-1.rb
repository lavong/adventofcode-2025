#!/usr/bin/env ruby
require "matrix"

input = File.read(File.expand_path("../day04.txt", __FILE__))

adjacent_coords = ([-1, 0, 1].repeated_permutation(2).to_a - [[0, 0]]).map { |x, y| Vector[x, y] }
grid = input.split("\n").map { |line| line.chars }
rows = 0...grid.length
cols = 0...grid[0].length

accessible_rolls = 0
for row in rows
  for col in cols
    adjacent_rolls = 0
    for c in adjacent_coords
      x, y = col + c[0], row + c[1]
      if cols.include?(x) && rows.include?(y) && grid[y][x] == '@'
        adjacent_rolls += 1
      end
    end
    if grid[row][col] == '@' && adjacent_rolls < 4
      accessible_rolls += 1
    end
  end
end

puts "solution part 1: #{accessible_rolls}"
