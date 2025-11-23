#!/usr/bin/env ruby

input = File.read(File.expand_path("../2024-day01.txt", __FILE__))

left, right = input.split("\n").map { |line| line.split(/\s+/).map(&:to_i) }.transpose
similarity_score = left.map { |n| n * right.filter { _1 == n }.count }.sum

puts "solution part 2: #{similarity_score}"
