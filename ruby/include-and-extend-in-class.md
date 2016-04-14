# Include and Extend In Class
:notebook:

Try to figure out difference between include and extend module in class:
```ruby
module ExtendMethods
  def cmethod
    puts "class methods"
  end
end

module InstanceMethods
  def imethod
    puts "instance methods"
  end
end

module SingletonMethods
  def singleton_method
    puts "singleton methods"
  end
end

class M
  extend ExtendMethods
  include InstanceMethods
end

M.cmethod       #=> class methods
M.new.imethod   #=> instance methods

m = M.new.extend(SingletonMethods)
m.singleton_method   #=> singleton methods
```
In short, use `extend` to add class methods and `include` to add instance methods in
your class. BTW, also can use `extend` to add singleton methods to a instance just like
the above example.

# Reference
* [blog](https://samurails.com/interview/include-vs-extend-ruby/)
* [a book about ruby programming by this author](https://twitter.com/takahashim)
