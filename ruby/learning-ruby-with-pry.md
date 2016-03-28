# Learning Ruby With Pry
:notebook:  

### Installation
Use `gem` to install pry and pry-doc(it would include ruby core documentations).
```bash
  $ gem install pry pry-doc
```

In order to look into documentations for specific methods in ruby, we can use
`show-doc` in pry console:
```ruby
% pry                                                                                                   
[1] pry(main)>
[2] pry(main)> show-doc Array#include?

From: array.c (C Method):
Owner: Array
Visibility: public
Signature: include?(arg1)
Number of lines: 7

Returns true if the given object is present in
self (that is, if any object == anObject),
false otherwise.

   a = [ "a", "b", "c" ]
   a.include?("b")   #=> true
   a.include?("z")   #=> false

[3] pry(main)> # handy shortcut ? for `show-doc`
[4] pry(main)> ? Array#include?
   ....
```
We also can use `show-method` to look into source code for specific method:
```ruby
[6] pry(main)> show-method Array#include?

From: array.c (C Method):
Owner: Array
Visibility: public
Number of lines: 12

VALUE
rb_ary_includes(VALUE ary, VALUE item)
{
    long i;

    for (i=0; i<RARRAY_LEN(ary); i++) {
	if (rb_equal(RARRAY_PTR(ary)[i], item)) {
	    return Qtrue;
	}
    }
    return Qfalse;
}
```
Then, we can `cd` into class state and `ls` to show methods in classes, which shows class methods and instance methods in the following output:
```ruby
[9] pry(Array):1> cd Array
[10] pry(Array):2> ls
Object.methods: yaml_tag
Array.methods: []  columnize_opts  columnize_opts=  try_convert
Array#methods:
  &    []=            collect!     delete_at   eql?        hash      length        pretty_print_cycle    replace       select     slice!      to_h       |
  *    any?           combination  delete_if   fetch       include?  map           product               reverse       select!    sort        to_s
  +    assoc          compact      dig         fill        index     map!          push                  reverse!      shelljoin  sort!       transpose
  -    at             compact!     drop        find_index  insert    pack          rassoc                reverse_each  shift      sort_by!    uniq
  <<   bsearch        concat       drop_while  first       inspect   permutation   reject                rindex        shuffle    take        uniq!
  <=>  bsearch_index  count        each        flatten     join      place         reject!               rotate        shuffle!   take_while  unshift
  ==   clear          cycle        each_index  flatten!    keep_if   pop           repeated_combination  rotate!       size       to_a        values_at
  []   collect        delete       empty?      frozen?     last      pretty_print  repeated_permutation  sample        slice      to_ary      zip
instance variables: @columnize_opts
locals: _  __  _dir_  _ex_  _file_  _in_  _out_  _pry_
```
With `?` command(as show-doc), we can see the owner of methods to distinguish class methods and instance methods:
```ruby
[19] pry(Array):2> ? try_convert

From: array.c (C Method):
Owner: #<Class:Array>
Visibility: public
...
[20] pry(Array):2> ? empty?

From: array.c (C Method):
Owner: Array
Visibility: public
Signature: empty?()
....
```
NOTE: `pry` also has great features with debugging which I don't mention here. Maybe later.

# Reference
* [post in sitepoint](http://www.sitepoint.com/rubyists-time-pry-irb/)
