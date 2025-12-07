#!/usr/bin/env ruby

input = File.read(File.expand_path("../day07.txt", __FILE__))

def find(s, grid)
  grid.each_with_index do |row, y|
    grid[y].each_with_index do |c, x|
      return [y, x] if c == s
    end
  end
  [0, 0]
end

grid = input.split("\n").map { |line| line.chars }

start = find 'S', grid
grid[start[0] + 1][start[1]] = '|'

beams = Set.new
beams.add [start[0] + 1, start[1]]
splits = 0
until beams.empty?
  y, x = beams.first
  beams.delete(beams.first)

  if y + 1 < grid.length
    case grid[y + 1][x]
    when '^'
      beams.add [y + 1, x - 1]
      beams.add [y + 1, x + 1]
      splits += 1
      grid[y + 1][x - 1] = '|'
      grid[y + 1][x + 1] = '|'
    else
      beams.add [y + 1, x]
      grid[y + 1][x] = '|'
    end
  end
end

grid.each { |row| puts row.join }

puts "solution part 1: #{splits}"
