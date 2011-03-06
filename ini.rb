#!/usr/bin/env ruby -w

class INIFile
	attr_reader :data

	def initialize
		@data = {}
	end

	def load(filename)
		f = File.open(filename, 'r')
		begin
			section = nil
			f.each_line do |line|
				next if line =~ /^\s*#|^\s*$/
				if s = line[/^\s*\[(.*)\]\s*$/, 1]
					section = s.to_sym
					@data[section] ||= {}
				else
					key = line[/^\s*(.+?)\s*=/, 1]
					value = line[/^\s*.+?\s*=\s*(.*)\s*$/, 1]
					@data[section][key.to_sym] = value if section && key && value
				end
			end
			self
		ensure
			f.close if f
		end
	end

	def save(filename)
		f = File.open(filename, 'w')
		begin
			@data.each do |section, datum|
				f.puts unless f.pos == 0
				f.puts "[#{section.to_s}]"
				datum.each do |key, value|
					f.puts "\t#{key.to_s} = #{value}"
				end
			end
			self
		ensure
			f.close if f
		end
	end

	def read(section, key)
		@data[section.to_sym][key.to_sym] if section && key
	end

	def write(section, key, value)
		(@data[section.to_sym] ||= {})[key.to_sym] = value
	end
end

ini = INIFile.new
ini.write(:sectionOne, :keyOne, 'Foo')
ini.write(:sectionOne, :keyTwo, 'Bar')
ini.write(:sectionTwo, :keyOne, 'Baz')
p ini.data
ini.save('my_file.ini')

puts `cat my_file.ini`

ini = INIFile.new
p ini.load('my_file.ini').data
