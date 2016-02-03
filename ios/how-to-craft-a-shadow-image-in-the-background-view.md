# How to craft a shadow image in the background view
:notebook:   
Use **UIEdgeInsets** data type to craft a frame of view around your content view, just like the padding in the web development.  

*In Apple Documentation*,  
> Edge inset values are applied to a rectangle to shrink or expand the area represented by that rectangle. Typically, edge insets are used during view layout to modify the view’s frame. Positive values cause the frame to be inset (or shrunk) by the specified amount. Negative values cause the frame to be outset (or expanded) by the specified amount.

Firstly, we know the frame information of our content view and have some useful shadow image as
the background image. Then we use `UIEdgeInsetsInsetRect()` or `CGRectInset()` to glue them together. For example,  
```objc

// NOTE: This code snippet might be shown in XXXViewController.m.
CGRect contentFrame = contentView.frame;
// NOTE: Assume this is a drop shadow
UIEdgeInsets shadowInsets = UIEdgeInsetsMake(0, 0, -15, -15);
UIImageView *shadowBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shadow.png"]];
shadowBackgroundImageView.frame = UIEdgeInsetsInsetRect(contentFrame, shadowInsets);
[self.view addSubview:shadowBackgroundImageView];
[self.view addSubview:contentView];

```
`CGRectInset()` only get dx, dy as parameters which is used to adjust x-cooridnate and y-coordinate not like top, left, bottom and right in `UIEdgeInsetsMake()`.
`UIEdgeInsetsMake()` + `UIEdgeInsetsInsetRect()` is more flexible for my adjustment; however this depends on your case.

```objc
CGRect originRectangle = CGRectMake(0,0, 100, 100);
CGRect afterInsetsRectangle = CGRectInset(originRectangle, 30, 20);
NSLOG(@"%@", NSStringFromCGRect(originRectangle));
NSLOG(@"%@", NSStringFromCGRect(afterInsetsRectangle));

// console output:
// 2016-02-04 00:32:32.302 testView[73695:8626907] {{0, 0}, {100, 100}}
// 2016-02-04 00:32:32.302 testView[73695:8626907] {{30, 20}, {40, 60}}
```
According to some gist on the github, we can learn more clearly:
```objc
inline static CGRect CGRectEdgeInset(CGRect rect, UIEdgeInsets insets) {
    return CGRectMake(CGRectGetMinX(rect)+insets.left, CGRectGetMinY(rect)+insets.top, CGRectGetWidth(rect)-insets.left-insets.right, CGRectGetHeight(rect)-insets.top-insets.bottom);
}
```


# Reference
* [understandable gist](https://gist.github.com/zrxq/5363610) :+1:
* [CGRect tricks](https://www.cocoanetics.com/2010/07/cgrect-tricks/) :star:
* [some useful shadow image](https://www.google.com.tw/search?rls=com.microsoft%3Aen-US%3A%7Breferrer%3Asource%3F%7D&rlz=1I7GGLL_zh-TW&biw=1280&bih=678&tbm=isch&sa=1&q=rectangular+shadow+image&oq=rectangular+shadow+image&gs_l=img.3...16184.20271.0.20411.24.20.0.4.4.0.200.1928.0j15j1.16.0....0...1c.1.64.img..4.16.1490.KLTiW8zoyGo#imgrc=PCKK2kprmZ5kDM%3A)
