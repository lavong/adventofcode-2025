#!/usr/bin/env ruby

input = File.read(File.expand_path("../day02.txt", __FILE__))

sum_invalid_ids = input.split(",").flat_map { |r|
  n, m = r.split("-").map(&:to_i)
  (n..m).to_a
        .filter { _1 > 9 }
        .filter {
          s = _1.to_s
          is_funny_id = false
          (1...s.length).each do |i|
            s1 = s[0, i]
            s2 = s[i..]
            (0..s.length).each { s2.chomp!(s1) }
            if s2.length == 0
              is_funny_id = true
              break
            end
          end
          is_funny_id
        }
}.sum

puts "solution part 2: #{sum_invalid_ids}"
