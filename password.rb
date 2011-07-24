#!/usr/bin/env ruby
# encoding: utf-8

$VERBOSE = true

print 'Password: '
begin
  system 'stty -echo'
  password = STDIN.gets.chomp
  puts
ensure
  system 'stty echo'
end

puts "Password is '#{password}'."
