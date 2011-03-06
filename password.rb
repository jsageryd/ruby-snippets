#!/usr/bin/env ruby -w

print 'Password: '
begin
	system 'stty -echo'
	password = STDIN.gets.chomp
	puts
ensure
	system 'stty echo'
end

puts "Password is '#{password}'."
