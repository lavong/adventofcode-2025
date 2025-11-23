#!/usr/bin/env ruby

input = File.read(File.expand_path("../2024-day01.txt", __FILE__))

left, right = input.split("\n").map { |line| line.split(/\s+/).map(&:to_i) }.transpose
total_distance = left.sort.zip(right.sort).map { |a, b| (a - b).abs }.sum

puts "solution part 1: #{total_distance}"
