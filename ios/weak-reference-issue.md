# Weak Reference Issue

We often used `__weak` to prevent the retain cycle problem in a block,
but it occurs another issue that weak variable would be `nil` if the
object pointed originally by weak variable released during we use it in block.
To fix this , we declare one more variable in block to
to retain the weak variable:
```objc
__weak typeof(self) weakSelf = self;
[[PHNetworkService sharedService] fetchRequest:request withCompletionBlock:
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

## Reference
* [strongSelf vs weakSelf](https://dhoerl.wordpress.com/2013/04/23/i-finally-figured-out-weakself-and-strongself/)
* [issue with __block and __weak](http://honglu.me/2015/01/06/weak%E4%B8%8Eblock%E5%8C%BA%E5%88%AB/)
* [arc best practice](http://amattn.com/p/arc_best_practices.html)
