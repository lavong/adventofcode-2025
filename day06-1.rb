#!/usr/bin/env ruby

input = File.read(File.expand_path("../day06.txt", __FILE__))

lines = input.split("\n").map { |line| line.split("\s") }.transpose

grand_total = 0
lines.each do |line|
  op = line.pop
  nums = line.map(&:to_i)
  grand_total += op == '*' ? nums.reduce(:*) : nums.sum
end

puts "solution part 1: #{grand_total}"
