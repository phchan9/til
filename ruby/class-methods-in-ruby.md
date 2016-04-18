# Class Methods In Ruby
:notebook:

How to add class methods to a class? There are three ways to do it.
First, use `class << CLASSNAME  ... end` to declare class methods like instance
methods declaration before.

```ruby
class << String
  def hello(name)
    puts "#{name} say hello"
  end
end

String.hello("123") #=> 123 say hello
```
Then, use `self.classmethod` in the declaration of class.
```ruby
class String
  def self.hello1
    puts "hello1"
  end
end

String.hello1 #=> hello1
```
Actually the above is the shorthand of the following code snippet,
```ruby
class String
  class << self
    def hello2
      puts "hello2"
    end
  end
end

String.hello2 #=> hello2
```
According to stackoverflow, we can found that `self` in class means,
> class << self opens up self's singleton class, so that methods can be redefined for the current self object (which inside a class or module body is the class or module itself)

Lastly, we can use `CLASSNAME.method` to declare class methods.
```ruby
def String.hello3
  puts "hello3"
end

String.hello3 #=> hello3
```

# Reference
* [stackoverflow](http://stackoverflow.com/questions/2505067/class-self-idiom-in-ruby)
* [a book about ruby programming by this author](https://twitter.com/takahashim)
