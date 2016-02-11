# Fix some issue in lldb   
:notebook:   
Sometimes it happened to me the error when I wanted to print out variables related to frame.
```objc
(lldb) po self.view.bounds
error: property 'bounds' not found on object of type 'UIView *'
error: 1 errors parsing expression
```
It was awkward when I needed to debug some instance like UIView or subviews, so I got the
solution from other's blog. Use `expr @import UIKit` to solve this problem.

```objc
(lldb) po self.view.bounds
error: property 'bounds' not found on object of type 'UIView *'
error: 1 errors parsing expression
(lldb) e @import UIKit
(lldb) po self.view.bounds
(origin = (x = 0, y = 0), size = (width = 768, height = 1024))
 (origin = (x = 0, y = 0), size = (width = 768, height = 1024))

```
NOTE: `expr` could be abbreviated to `e`.


# Reference
* [Great Reference](http://furbo.org/2015/05/11/an-import-ant-change-in-xcode/) :+1:
