#!/usr/bin/env ruby

input = File.read(File.expand_path("../day03.txt", __FILE__))

def max_joltage(battery, i, depth, cache)
  return 0 if i == battery.length || depth == 12
  key = [i, depth]
  return cache[key] if cache.include? key

  max = max_joltage(battery, i + 1, depth, cache)
  if depth < 12
    max = [max, "#{battery[i]}#{max_joltage(battery, i + 1, depth + 1, cache)}".to_i].max
  end
  cache[key] = max
  max
end

max_joltage = input.split("\n").map { max_joltage(_1, 0, 0, {}) }.sum / 10

puts "solution part 2: #{max_joltage}"
