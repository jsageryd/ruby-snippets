#!/usr/bin/env ruby -w
# encoding: utf-8

require 'yaml'

p yaml = [:foo, :bar, :baz].to_yaml
p array = YAML.load(yaml)
