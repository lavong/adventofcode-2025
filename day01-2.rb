#!/usr/bin/env ruby

input = File.read(File.expand_path("../day01.txt", __FILE__))

dial = 50
password = 0
input.split("\n")
     .each { |line|
       rotation = line[1..].to_i
       dir = line.chr == 'L' ? -1 : 1
       Array.new(rotation) { dir }.each do |r|
         dial = (dial + dir) % 100
         password += dial == 0 ? 1 : 0
       end
     }

puts "solution part 2: #{password}"
