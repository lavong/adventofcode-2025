#!/usr/bin/env ruby

input = File.read(File.expand_path("../day05.txt", __FILE__))

ranges = input.split(/\n{2,}/)[0].split("\n").map { |line| line.split("-").map(&:to_i).to_a }.sort!

p = 0
fresh_ids = ranges.map { |s, e|
  start = p >= s ? p + 1 : s
  p = [p, e].max
  start <= e ? e - start + 1 : 0
}.sum

puts "solution part 2: #{fresh_ids}"
