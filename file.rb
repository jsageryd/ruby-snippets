#!/usr/bin/env ruby -w
# encoding: utf-8

# Save to file
File.open('my_file', 'w') do |io|
  io.puts "Some text"
end

# Load from file
File.open('my_file', 'r') do |io|
  io.each_line do |l|
    puts l
  end
end
