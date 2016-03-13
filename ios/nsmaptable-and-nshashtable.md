# NSMapTable And NSHashTable
:notebook:  

Scenario:  
Why we need `NSHashTable` and `NSHashTable`? and when to use them instead of using
`NSDictionary` and `NSSet`?

Ans:  
NSHipster said that objects in `NSSet` are strongly referenced, as the `NSDictionary` values.
Keys, on the other hand, are copied by `NSDictionary`. So what if we want to store these objects more efficiently or with some memory management concern? We could use `NSHashTable` and `NSMapTable` with some options to let content referenced weakly.

`NSMapTable` also has four extra factory methods:

    + (id)mapTableWithStrongToStrongObjects;
    + (id)mapTableWithWeakToStrongObjects;
    + (id)mapTableWithStrongToWeakObjects;
    + (id)mapTableWithWeakToWeakObjects;
This gives you all four possible combinations of weak and strong.

There is one extra factory method on `NSHashTable` to let its content referenced weakly:

    + (id)hashTableWithWeakObjects;


NOTE: Some practical performance and unexpected result with `NSMapTable` and `NSHashTable` could be referred to third one in *Reference* section.  More detail about `NSPointerFunction` and `NSPointerOptions` could be found in **mikeash** blog.

# Reference
* [NSHipster](http://nshipster.com/nshashtable-and-nsmaptable/)
* [mikeash](https://www.mikeash.com/pyblog/friday-qa-2010-05-28-leopard-collection-classes.html)
* [practical experiment and explanation](http://cocoamine.net/blog/2013/12/13/nsmaptable-and-zeroing-weak-references/)
