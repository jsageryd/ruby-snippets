#!/usr/bin/env ruby
# encoding: utf-8

$VERBOSE = true

threads = []
5.times do |n|
  threads << Thread.new(n) do |myN|
    sleep rand / 10.0
    puts myN
  end
end

threads.each do |t|
  t.join
end
