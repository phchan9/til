# Weak Reference Issue

We often used `__weak` to prevent the retain cycle problem in a block,
but it occurs another issue that weak variable would be `nil` if the
object pointed originally by weak variable released during we use it in block.
To fix this , we declare one more variable in block to
to retain the weak variable:
```objc
__weak typeof(self) weakSelf = self;
[self.APIService fetchRequest:request withCompletionBlock:
^(NSArray *infoList){
    typeof(self) strongSelf = weakSelf;
    if(strongSelf){
        // do the callback work
    } else {
        // do nothing
        // It is still possible that strongSelf
        // get nil from weakSelf
    }
}];

```
NOTE:  
According to the comment in stackoverflow,
> Keep in mind the strong reference cycle may not be this straightforward. For example, if your controller has a strong reference to an object, that object has a strong reference to a completion block, and then the completion block strongly references your controller, you'll still have a retain cycle, just with 3 objects instead of 2     

We should need to check retain cycle with more care by this reminder.

## Reference
* [strongSelf vs weakSelf](https://dhoerl.wordpress.com/2013/04/23/i-finally-figured-out-weakself-and-strongself/)
* [issue with __block and __weak](http://honglu.me/2015/01/06/weak%E4%B8%8Eblock%E5%8C%BA%E5%88%AB/)
* [arc best practice](http://amattn.com/p/arc_best_practices.html)
* [stackover problem with block and retain cycle](http://stackoverflow.com/questions/19280650/afnetworking-uitableview-and-blocks)
