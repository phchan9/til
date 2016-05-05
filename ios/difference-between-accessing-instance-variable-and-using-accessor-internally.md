# Difference Between Accessing Instance Variable And Using Accessor Internally
:notebook:  
Problem:  
What is the difference between accessing instance variable directly and using accessor
when we implement methods in class implementation file(\*.m).

Answer:  
According to the section, "Item 7: Access Instance Variables Primarily Directly When Accessing Them Internally", in the book, [Effective Objective-C](http://www.amazon.com/Effective-Objective-C-2-0-Specific-Development/dp/0321917014), it told some points about the proper way to access our instance variable.

> Prefer to read data directly through instance variables internally and write data by using accessor.    

Direct accessing instance variable is undoubtedly faster than using properties as it doesn't go through message passing in objective-C mechanism. However, accessing instance variable directly will bypass property attributes like memory management semantics(e.g. `copy`). Additionally, KVO notification would be not fired when accessing instance variable. Thus, the author suggests us that read data directly and write data through setter.

> Within initializer and dealloc, always read and write data directly through instance variable.

When your class has some subclasses, which means these subclasses might override setter/getter, it might not our expectation that these setter defined by subclasses would be called by `init*`/`dealloc` methods in base class.

> Sometimes, you will need read data through properties for lazy initialization.

Accessor might be helpful when we need the lazy initialization for some expensive instance variable. We can use accessor like this:
```objc
- (SPTStream)streamInCategory
{
  if (!_streamInCategory) {
    /* init _streamInCategory */
  }
  return _streamInCategory;
}

```

# Reference
* books: [Effective Objective-C](http://www.amazon.com/Effective-Objective-C-2-0-Specific-Development/dp/0321917014)
