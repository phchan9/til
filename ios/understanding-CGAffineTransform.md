# Understanding CGAffineTransform
:memo:   

Every time see these terms, I seldom remember the definition of them, so write down some note here to memorize it.

The definition of CGAffineTransform in Apple official documentation:
> The CGAffineTransform data structure represents a matrix used for affine transformations. A transformation specifies how points in one coordinate system map to points in another coordinate system. ...

You can think of it as the matrix operation we learned in **Linear Algebra** such as identity matrix, rotation matrix and so on.

## Functions
* CGAffineTransformMakeTranslation : use parameters `tx`, `ty` to generate transform which only do the shift operation
> OBJECTIVE-C   
CGAffineTransform CGAffineTransformMakeTranslation ( CGFloat tx, CGFloat ty );

* CGAffineTransformMakeRotation : use parameter `angle` to generate rotation transform (matrix)
> OBJECTIVE-C  
CGAffineTransform CGAffineTransformMakeRotation ( CGFloat angle );  

* CGAffineTransformMakeScale : use parameters `sx`, `sy` to generate transform which can scale the x-axis/y-axis of the coordinate system
> OBJECTIVE-C   
CGAffineTransform CGAffineTransformMakeScale ( CGFloat sx, CGFloat sy );

* CGAffineTransformMake : general function to generate transform including scale and shift
> OBJECTIVE-C  
CGAffineTransform CGAffineTransformMake ( CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty );






## Reference
* [good reference in chinese](http://xummer26.com/blog/CGAffineTransform-simple-analysis.html) :+1:
* [official doc](https://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CGAffineTransform/#//apple_ref/c/macro/CGAffineTransformMake)
