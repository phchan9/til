#!/usr/bin/env ruby

require 'colorize'

print "input category: "
input_category_name = gets.strip.downcase
print "input topic name: "
input_topic_name = gets.strip.downcase

if input_category_name.empty? || input_topic_name.empty?
  puts "Error: category name and topic name can't be blank...".red
  exit 1
end

file_title = input_topic_name.split.map { |word| word.capitalize }.join(" ")
file_name = input_topic_name.gsub(/\s+/m,"-") + ".md"
puts "new file: " + file_name.green + " with title: " + file_title.blue

file_path = input_category_name + "/" + file_name

File.open(file_path, "w") do |md_file|
  md_file.write("# #{file_title}\n\n# Reference\n")
end
puts "write template post into path: " + file_path.bold
