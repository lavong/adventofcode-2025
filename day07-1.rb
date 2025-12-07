#!/usr/bin/env ruby

input = File.read(File.expand_path("../day07.txt", __FILE__))

def find(s, grid)
  grid.each_with_index do |_, y|
    grid[y].each_with_index do |c, x|
      return [y, x] if c == s
    end
  end
  [0, 0]
end

grid = input.split("\n").map { |line| line.chars }

sy, sx = find 'S', grid
grid[sy + 1][sx] = '|'

beams = Set.new([[sy + 1, sx]])
splits = 0
until beams.empty?
  y, x = beams.first
  beams.delete(beams.first)
  break if y + 1 >= grid.length

  if grid[y + 1][x] == '^'
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

grid.each { puts _1.join }

puts "solution part 1: #{splits}"
