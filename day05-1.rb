#!/usr/bin/env ruby

input = File.read(File.expand_path("../day05.txt", __FILE__))

ranges, ids = input.split(/\n{2,}/).map { |blocks| blocks.split("\n") }
ranges = ranges.map { |r| r.split('-').map(&:to_i) }
ids = ids.map(&:to_i)

fresh_ingredients = 0
for id in ids
  fresh = false
  for n, m in ranges
    if id >= n && id <= m
      fresh = true
    end
  end
  if fresh
    fresh_ingredients +=1
  end
end

puts "solution part 1: #{fresh_ingredients}"
