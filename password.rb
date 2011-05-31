#!/usr/bin/env ruby -w
# encoding: utf-8

print 'Password: '
begin
	system 'stty -echo'
	password = STDIN.gets.chomp
	puts
ensure
	system 'stty echo'
end

puts "Password is '#{password}'."
