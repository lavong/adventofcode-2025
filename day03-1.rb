#!/usr/bin/env ruby

input = File.read(File.expand_path("../day03.txt", __FILE__))

def max_joltage(battery)
  max = 0
  (0..battery.length).each do |i|
    ((i + 1)..battery.length).each do |j|
      joltage = "#{battery[i]}#{battery[j]}".to_i
      if joltage > max
        max = joltage
      end
    end
  end
  max
end

max_joltage = input.split("\n").map { max_joltage _1 }.sum

puts "solution part 1: #{max_joltage}"
