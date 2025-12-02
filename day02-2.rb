#!/usr/bin/env ruby

input = File.read(File.expand_path("../day02.txt", __FILE__))

def invalid_id(s)
  return false if s.length < 2
  (1...s.length).each do |i|
    s1 = s[0, i]
    s2 = s[i..]
    # TODO make it less meh.
    (0..(s.length / i)).each { break if s2.chomp!(s1) == nil }
    if s2.length == 0
      return true
    end
  end
  false
end

sum_invalid_ids = input.split(",").flat_map { |r|
  n, m = r.split("-").map(&:to_i)
  (n..m).to_a.filter { invalid_id _1.to_s }
}.sum

puts "solution part 2: #{sum_invalid_ids}"
