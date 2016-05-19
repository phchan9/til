# Several Sizing Methods In iOS
:notebook:  

Scenario:   
We often need to update view layout with different user interaction or under different state. Although we now have the autolayout feature in iOS, we still need  programmatically do some updating ui logic on our own in some case(such as autolayout performance issue or working with legacy code). Then, I just saw some methods used to solve this scene in several projects. Therefore I note it here.  

In some case, we often call `sizeToFit` to stay label or button tight with their boundary. When we call `sizeToFit`, Cocoa Touch would call `sizeThatFits` to get the proper size for this view, which could be customized by yourself to make sure your component's size show well. According to apple doc,

> sizeThatFits   
> Asks the view to calculate and return the size that best fits the specified size.

> The default implementation of this method returns the existing size of the view. Subclasses can override this method to return a custom value based on the desired layout of any subviews. For example, a UISwitch object returns a fixed size value that represents the standard size of a switch view, and a UIImageView object returns the size of the image it is currently displaying.

How about resizing view with autolayout setting? Use UIView's method, `systemLayoutSizeFittingSize`, which will return the size of the view that satisfies the constraints it holds. Detail information in my third reference.



NOTE:  
In my second reference post, it points out that we should use `sizeThatFits` method on labels or buttons instead of using NSString-related methods(e.g. NSString's `sizeWithFont:` or NSAttributedString's `boundingRectWithSize:options:context:`), which cause some code smell. Despite the reason, I used `boundingRectWithSize:options:context:` in my project because it still works.:D   
In my third reference, it talks about how to use `systemLayoutSizeFittingSize` when we deal with UITableViewCell with our autolayout which shows that we use this method on `tableViewCell.contentView` rather than `tableViewCell`.

# Reference
* [apple documentation about `sizeToFit` for UIView](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/#//apple_ref/occ/instm/UIView/sizeToFit)
* [great post about doing wrong to sizing label](http://doing-it-wrong.mikeweller.com/2012/07/youre-doing-it-wrong-2-sizing-labels.html)
* [stackoverflow: How to resize superview to fit all subviews with autolayout?](http://stackoverflow.com/questions/18118021/how-to-resize-superview-to-fit-all-subviews-with-autolayout/18155803#18155803)
