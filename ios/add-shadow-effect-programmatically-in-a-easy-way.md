# Add shadow effect programmatically in a easy way
:notebook:  

Different from [how to craft a shadow image in the background view](how-to-craft-a-shadow-image-in-the-background-view.md), we use built-in methods
to craft shadow programmatically. Use **CALayer**'s shadow-related property ,   
```objc
// set several shadow property
_backGroundView.layer.shadowOffset = CGSizeMake(1, 0);
_backGroundView.layer.shadowOpacity = 0.35f;
_backGroundView.layer.shadowRadius = 1.0f;
_backGroundView.layer.shadowColor = [[UIColor blackColor] CGColor];
```

Setting `shadowPath` property can better the render performance issue. (More information in Reference)
```objc
// ... bottom of last context

UIEdgeInsets shadowInset = UIEdgeInsetsMake(1, 1, 1, 1);
CGRect shadowRect = UIEdgeInsetsInsetRect(_backGroundView.frame, shadowInset);
_backGroundView.layer.shadowPath = [[UIBezierPath bezierPathWithRect:shadowRect] CGPath];
```

2016.6.13 **NOTE:**   
When I used this technique to draw shadow in other projects, it turned out that there are some blending glitch with user interaction(e.g. scroll in tableView with tableViewCell with the shadow background). Then, I found **rasterizing** this technique in the book which is focus on **Core Animation**(shown in my reference list):
> Enabling the **shouldRasterize** property causes the layer to be drawn into an offscreen image. That image will then be cached and drawn in place of the actual layer’s contents and sublayers. If there are a lot of sublayers or they have complex effects applied, this is generally less expensive than redrawing everything every frame.

After setting `shouldRasterize` to `YES` and `rasterizationScale` to the proper scale, scrolling in my tableView is much more smooth than before. Also noted that rasterizing might not be a good way to draw layers,

> it’s very important to avoid rasterizing layers whose content changes every frame because it will negate any caching benefit, and actually make the performance worse.




# Reference
* [stackoverflow Q:`Whats the best way to add a drop shadow to my UIView`](http://stackoverflow.com/questions/9761189/whats-the-best-way-to-add-a-drop-shadow-to-my-uiview)
* [clipToBounds vs maskToBounds](http://stackoverflow.com/questions/1177775/how-is-the-relation-between-uiviews-clipstobounds-and-calayers-maskstobounds)
* Book: **iOS Core Animation: Advanced Techniques**, *Chapter4, Group Opacity* sections. [gist note about this book](https://gist.github.com/JeOam/94e833bcefd738d805cc#group-opacity)
* [stackoverflow Q: `fastest-way-to-do-shadows-on-ios`](http://stackoverflow.com/questions/10133109/fastest-way-to-do-shadows-on-ios)
