#!/usr/bin/env ruby

input = File.read(File.expand_path("../day05.txt", __FILE__))

ranges = input.split(/\n{2,}/)[0].split("\n").map { |line| line.split("-").map(&:to_i).to_a }.sort!

fresh_ids = 0
p = 0
for n, m in ranges
  start = p >= n ? p + 1 : n
  p = [p, m].max
  if start <= m
    fresh_ids += m - start + 1
  end
end

puts "solution part 2: #{fresh_ids}"
