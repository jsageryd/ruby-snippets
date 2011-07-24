#!/usr/bin/env ruby -w
# encoding: utf-8

require 'yaml'

p array = [:foo, :bar, :baz]

# String
p yaml = array.to_yaml
p loaded = YAML.load(yaml)

# File save/load
filename = 'my_file.yaml'
File.open(filename, 'w') do |io|
  YAML.dump(array, io)
end
loaded = YAML.load_file(filename)

# Clean up
File.delete(filename)
