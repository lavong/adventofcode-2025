#!/usr/bin/env ruby

input = File.read(File.expand_path("../day06.txt", __FILE__))

grid = input.split("\n").map { |line| line.chars }

grand_total = 0
op = grid[-1][0]
block_x = 0
for x in 0..grid[0].length
  op = grid[-1][x] if %w[* +].include? grid[-1][x]

  block_end = true
  for y in 0...grid.length
    block_end = false if x < grid[y].length && grid[y][x] != ' '
  end

  if block_end
    total = op == '*' ? 1 : 0
    for dx in block_x...x
      n = 0
      for y in 0...(grid.length - 1)
        dn = grid[y][dx]
        if dn != ' '
          n = 10 * n + dn.to_i
        end
      end
      op == '*' ? total *= n : total += n
    end
    block_x = x + 1
    grand_total += total
  end
end

puts "solution part 2: #{grand_total}"
