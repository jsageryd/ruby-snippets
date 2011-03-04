#!/usr/bin/env ruby -w

class NegativeArray
	def initialize(startIndex)
		@items = []
		@startIndex = startIndex
	end

	def [](index)
		@items[index-@startIndex+1]
	end

	def []=(index, value)
		@items[index-@startIndex+1] = value
	end
end

a = NegativeArray.new(-5)	# starting at -5
a[-5] = 'Foo'
a[10] = 'Bar'

puts "-5: #{a[-5]}"
puts "10: #{a[10]}"
