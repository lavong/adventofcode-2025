#!/usr/bin/env ruby

input = File.read(File.expand_path("../day05.txt", __FILE__))

ranges, ids = input.split(/\n{2,}/).map { |blocks| blocks.split("\n") }
ranges = ranges.map { |r| r.split('-').map(&:to_i) }

fresh_ingredients = ids.map(&:to_i).map { |id| ranges.any? { |n, m| (n..m).include? id } ? 1 : 0 }.sum

puts "solution part 1: #{fresh_ingredients}"
