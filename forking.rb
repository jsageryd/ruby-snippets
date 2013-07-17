#!/usr/bin/env ruby
# encoding: utf-8

$VERBOSE = true

forks = []
5.times do |n|
  forks << fork do
    puts "Fork #{Process.pid} started"
    t = Time.now
    nil until Time.now - t > 5
    puts "Fork #{Process.pid} done"
  end
end

forks.each do |f|
  Process.waitpid(f)
end
