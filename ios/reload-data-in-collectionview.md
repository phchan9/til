# Reload Data In CollectionView
:notebook:  

Problem:   
Sometimes, I made the collectionview reloaded its data source to call `[collectionView reloadData]` and it did reload the cell and data in itself;however,
it didn't update its view(its contentsize isn't updated) immediately (might update in next run loop, so it looked like cropped at some time). How to fixed it?

My Way:  
I just used `[collectionView layoutIfNeeded]` after calling `[collectionView layoutIfNeeded]` immediately.

Quotes from objc.io's post:
>  You can trigger this pass by calling `setNeedsLayout`, which does not actually go ahead and apply the layout immediately, but takes note of your request for later.

> To force the system to update the layout of a view tree immediately, you can call `layoutIfNeeded/layoutSubtreeIfNeeded` (on iOS and OS X respectively)  



# Reference
* [stackoverflow related question](http://stackoverflow.com/questions/18796891/uicollectionview-reloaddata-not-functioning-properly-in-ios-7)
* [advanced autolayout toolbox](https://www.objc.io/issues/3-views/advanced-auto-layout-toolbox/)
