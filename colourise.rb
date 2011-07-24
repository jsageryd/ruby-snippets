#!/usr/bin/env ruby -w
# encoding: utf-8

class Colour
  def self.colourise(text, color)
    "\e[##{color}m#{text}\e[0m"
  end

  def self.black(text); colourise text, 30; end
  def self.red(text); colourise text, 31; end
  def self.green(text); colourise text, 32; end
  def self.yellow(text);  colourise text, 33; end
  def self.blue(text);  colourise text, 34; end
  def self.magenta(text); colourise text, 35; end
  def self.cyan(text);  colourise text, 36; end
  def self.white(text); colourise text, 37; end
end

puts Colour.black 'Black text'
puts Colour.red 'Red text'
puts Colour.green 'Green text'
puts Colour.yellow 'Yellow text'
puts Colour.blue 'Blue text'
puts Colour.magenta 'Magenta text'
puts Colour.cyan 'Cyan text'
puts Colour.white 'White text'
