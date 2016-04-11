# Null In Objc
:notebook:  

When I encounter `nil`, `NULL`, `NSNull` and `Nil`, just confused about them. Therefore,
I write down some note about them here.

According to the table in the *NSHipster post*,   

| symbol | Value | Meaning |
| --- | --- | --- |
| NULL	| (void *)0	| literal null value for C pointers |
| nil	| (id)0	| literal null value for Objective-C objects |
| Nil	| (class)0	| literal null value for Objective-C classes|
| NSNull	| [NSNull null]	| singleton object used to represent null |

We can regard `NSNull` as boxing `nil` or `NULL` value so that we can use it in collections
such as `NSDictionary` or `NSArray`. I also use `NSParameterAssert` method as a parameter assertion to check pre-condition about input values.


# Reference
* [post about nil on nshipster](http://nshipster.com/nil/)
* [post about NSAssertionHandler on nshipster](http://nshipster.com/nsassertionhandler/)
