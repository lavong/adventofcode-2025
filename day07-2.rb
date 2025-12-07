#!/usr/bin/env ruby

input = File.read(File.expand_path("../day07.txt", __FILE__))

def timelines(y, x, grid)
  @cache ||= {}
  return 1 if y + 1 >= grid.length
  if grid[y + 1][x] == '^'
    @cache[[y, x]] ||= timelines(y + 1, x - 1, grid) + timelines(y + 1, x + 1, grid)
  else
    @cache[[y, x]] ||= timelines(y + 1, x, grid)
  end
end

grid = input.split("\n").map { |line| line.chars }
timelines = timelines 0, input.index('S'), grid

puts "solution part 2: #{timelines}"
