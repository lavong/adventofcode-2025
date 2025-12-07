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

def timelines(y, x, grid, cache)
  return 1 if y + 1 >= grid.length
  return cache[[y, x]] if cache.include? [y, x]
  if grid[y + 1][x] == '^'
    cache[[y, x]] = timelines(y + 1, x - 1, grid, cache) + timelines(y + 1, x + 1, grid, cache)
  else
    cache[[y, x]] = timelines(y + 1, x, grid, cache)
  end
end

grid = input.split("\n").map { |line| line.chars }
sy, sx = find 'S', grid
timelines = timelines sy, sx, grid, {}

puts "solution part 2: #{timelines}"
