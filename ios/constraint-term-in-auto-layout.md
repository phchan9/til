# Constraint Term In Auto Layout
:notebook:   

Problem:   
What is the difference between content hugging and content compression resistance in autolayout? What is the intrinsic content size?

Answer:   
According to objc.io post:
> The **intrinsic content size** is the size a view prefers to have for a specific content it displays. For example, UILabel has a preferred height based on the font, and a preferred width based on the font and the text it displays. A UIProgressView only has a preferred height based on its artwork, but no preferred width. A plain UIView has neither a preferred width nor a preferred height.

Content Hugging vs Content Compression Resistance
> Each view has **content compression resistance priorities** and **content hugging priorities** assigned for both dimensions. These properties only take effect for views which define an intrinsic content size, otherwise there is no content size defined that could resist compression or be hugged.

NOTE:    
There is a quick summary about content hugging and content compression resistance on stackoverflow(#question2):   
* Hugging => content does not want to grow
* Compression Resistance => content does not want to shrink



# Reference
* [objc post: advanced auto layout toolbox](https://www.objc.io/issues/3-views/advanced-auto-layout-toolbox/)
* [question1 about content hugging and content compression resistance on stackoverflow](http://stackoverflow.com/questions/15850417/cocoa-autolayout-content-hugging-vs-content-compression-resistance-priority)
* [question2 about content hugging and content compression resistance on stackoverflow](http://stackoverflow.com/questions/22599069/what-is-the-content-compression-resistance-and-content-hugging-of-a-uiview)
