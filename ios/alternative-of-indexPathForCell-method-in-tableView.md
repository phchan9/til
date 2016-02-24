# Alternative of indexPathForCell method in tableView
:notebook:   

Scenario:  
I got the nil value returned by `- (NSIndexPath *)indexPathForCell:(UITableViewCell *)cell` when I needed the corresponding indexPath for the specific cell. In Apple documentation, it says  
> An index path representing the row and section of the cell, or nil if the index path is invalid.

Ok, it means my argument *indexPath* was invalid but what does "*invalid*" mean? With the answer in stackoverflow, "*invaid*" means that the cell is not visible at that time.

Solutions:    
Use `-(NSIndexPath*)indexPathForRowAtPoint:(CGPoint)point` method which could find the cell no matter it is visible or not.
```objc
// After get the cell, we want to know its indexPath
NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:cell.center];

```
NOTE: same situation with CollectionView.




# Reference
* [stackoverflow](http://stackoverflow.com/questions/6930026/tableviewindexpathforcell-returns-nil)
