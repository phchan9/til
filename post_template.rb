#!/usr/bin/env ruby

require 'colorize'

print "input topic name: "
input_topic_name = gets.chomp

file_title = input_topic_name.split.map { |word| word.capitalize }.join(" ")
file_name = input_topic_name.gsub(/\s+/m,"-") + ".md"
puts "new file: " + file_name.green + " with title: " + file_title.blue

File.open(file_name, "w") do |md_file|
  md_file.write("# #{file_title}\n\n# Reference\n")
end
