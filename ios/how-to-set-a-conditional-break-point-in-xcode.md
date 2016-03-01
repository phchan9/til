# How to set a conditional breakpoint in Xcode properly
:notebook:   
Scenario:  
why my conditional expression not work properly?

Answer:   
I didn't give the explicit return type to let lldb know it very well. For example:  
```objc
(BOOL)[[item itemId] isEqualToString:@"43280bb5-2d69"]]
```
NOTE: If I don't give the `(BOOL)` , lldb take the breakpoint every time.


# Reference
* [stackoverflow](http://stackoverflow.com/questions/988621/how-to-set-a-conditional-breakpoint-in-xcode-based-on-an-object-string-property)
