# Memory Management Attributes For Properties
:notebook:  

Sometimes I still got confused when I saw `nonatomic` , `assign`, `copy`, `strong`, `retain`
and `weak` in attributes of property declaration. Therefore write down some notes
and more detail information to memorize it.

|attributes   |notes  	|
|---	        |---	|
|**weak**   	|  not only don't increase reference count, but which also automatically become nil when the referenced object is destroyed (zeroing weak), to avoid using dangling pointer	|
|**strong** 	|  increase the reference count of this object	|
|**retain**   |  same as **strong** actually (called in non-arc decade)	|   
|**assign**   |  used in scalar ivar properties	|
|**copy**   	| good practice to always set **immutable** properties to copy, because mutable versions can be passed into immutable properties and also used with block 	|        
|**nonatomic**| denote that the object being referenced in not thread safe, we often use this attribute with UI component owing to UI operations only executed in main thread   	|
|**atomic**   | guarantee the atomic operation on this property but might have some performance issue with thead-safety 	|
|**unsafe_unretained**   | like **weak** not to increase reference count; however, it don't do zeroing pointer which means we should use this carefully with dangling pointer issue  	|


# Reference
* [stackoverflow](http://stackoverflow.com/questions/8927727/objective-c-arc-strong-vs-retain-and-weak-vs-assign)
* [great explanation of ARC by mikeash](https://www.mikeash.com/pyblog/friday-qa-2011-09-30-automatic-reference-counting.html)
* [arc best practice (2013 updated)](http://amattn.com/p/arc_best_practices.html)
