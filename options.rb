#!/usr/bin/env ruby -w
# encoding: utf-8

require 'optparse'
require 'ostruct'

class OptionHandler
  def self.parse(args)
    options = OpenStruct.new
    opts = OptionParser.new do |o|
      o.banner = 'Usage: ./options.rb [options]'
      o.separator 'Example: ./options.rb -f -b \'My option\' -B -a foo,bar'
      o.separator ''

      o.on('-f', '--foo', 'Foo option') do |foo|
        options.foo = true
      end

      o.on('-b', '--bar SOMETHING', 'Bar mandatory argument') do |bar|
        options.bar = bar
      end

      o.on('-B', '--baz [SOMETHING]', 'Baz optional argument') do |baz|
        if baz then
          options.baz = baz
        else
          print 'Baz: '
          options.baz = STDIN.gets.chomp
        end
      end

      o.on('-a', '--array foo,bar', Array, 'Array of values') do |array|
        options.array = array
      end
    end
    opts.parse!(args)
    options
  end
end

p OptionHandler.parse(ARGV)
