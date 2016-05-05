# How To Ignore Clang Diagnostics
:notebook:  

Scenario:  
Clang would issue some warning about our coding style or some semantics but we just
don't need this warning in some case such as the case in code snippet in **AFNetworking**, which is mentioned in **NSHipster**'s post.

Solution:   
Learned from **NSHipster**'s post, we can use `#pragma` to deal with it. Check the following code snippet:
```Objc
// completionBlock is manually nilled out in AFURLConnectionOperation to break the retain cycle.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
    self.completionBlock = ^ {
        ...
    };
#pragma clang diagnostic pop

```
Just use `push` and `pop` to turn warning off for the specific code block. This is the example in **AFNetworking** library to disable diagnostic about retain cycle issue in completionBlock.


# Reference
* [NSHipster post about clang Diagnostics](http://nshipster.com/clang-diagnostics/)
* [NSHipster post about #pragma](http://nshipster.com/pragma/)
* [Clang warning options table](http://fuckingclangwarnings.com/)
