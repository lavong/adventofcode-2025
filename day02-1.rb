#!/usr/bin/env ruby

input = File.read(File.expand_path("../day02.txt", __FILE__))

sum_invalid_ids = input.split(",").flat_map { |r|
  n, m = r.split("-").map(&:to_i)
  (n..m).to_a
        .filter { _1 > 9 }
        .filter {
          s = _1.to_s
          p1, p2 = s.chars.each_slice(s.length / 2).map(&:join)
          s.length % 2 == 0 && p1 == p2
        }
}.sum

puts "solution part 1: #{sum_invalid_ids}"
