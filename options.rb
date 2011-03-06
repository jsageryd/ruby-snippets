#!/usr/bin/env ruby -w

require 'optparse'
require 'ostruct'

class OptionHandler
	def self.parse(args)
		options = OpenStruct.new
		opts = OptionParser.new do |opts|
			opts.banner = 'Usage: ./options.rb [options]'
			opts.separator 'Example: ./options.rb -f -b \'My option\' -B -a foo,bar'
			opts.separator ''

			opts.on('-f', '--foo', 'Foo option') do |foo|
				options.foo = true
			end

			opts.on('-b', '--bar SOMETHING', 'Bar mandatory argument') do |bar|
				options.bar = bar
			end

			opts.on('-B', '--baz [SOMETHING]', 'Baz optional argument') do |baz|
				if baz then
					options.baz = baz
				else
					print 'Baz: '
					options.baz = STDIN.gets.chomp
				end
			end

			opts.on('-a', '--array foo,bar', Array, 'Array of values') do |array|
				options.array = array
			end
		end
		opts.parse!(args)
		options
	end
end

p OptionHandler.parse(ARGV)
