# What Is NS_REQUIRES_SUPER Macro
:notebook:    

After reading some OSS ios project, I saw `NS_REQUIRES_SUPER` this macro
declared with methods' declaration. Therefore I dug into it and found out that
this macro would make clang warning that you forget to call the corresponding methods with it in parent class in your subclass methods. Consider the following code snippet in my reference link:
```Objc
@interface KPDObject : NSObject
- (void)reduceSize NS_REQUIRES_SUPER;
@end
@interface KPDDataObject : KPDObject
//...
@end
@implementation KPDDataObject
//...
- (void)reduceSize
{
    // This will result in a warning: KPDDataObject:
    // Method possibly missing a [super reduceSize] call.
    [self gzipDataIfNeeded];
}
@end

```

NOTE: we still can ignore this warning with the methods in this [post](ios/how-to-ignore-clang-diagnostics.md) which I noted before.


# Reference
* [blog post](http://www.dudas.co.uk/ns_requires_super/)
