#!/usr/bin/env ruby

input = File.read(File.expand_path("../day01.txt", __FILE__))

dial = 50
password = input.split("\n")
                .map { |line| line[1..].to_i * (line.chr == 'L' ? -1 : 1) }
                .map { |rotation| dial = (dial + rotation).modulo(100) }
                .count { _1 == 0 }

puts "solution part 1: #{password}"
