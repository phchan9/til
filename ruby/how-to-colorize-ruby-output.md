# How To Colorize Ruby Output
:notebook:   

Use gem `colorize`. Check out my code snippet in *post_template.rb*

```ruby
require 'colorize'

print "input topic name: "
input_topic_name = gets.chomp

file_title = input_topic_name.split.map { |word| word.capitalize }.join(" ")
file_name = input_topic_name.gsub(/\s+/m,"-") + ".md"
# colorize my output 
puts "new file: " + file_name.green + " with title: " + file_title.blue

```

# Reference
* [stackoverflow](http://stackoverflow.com/questions/1489183/colorized-ruby-output)
* [colorize github](https://github.com/fazibear/colorize)
