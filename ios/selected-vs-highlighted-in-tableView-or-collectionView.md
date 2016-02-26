# Selected vs Highlighted in TableView/CollectionView
:notebook:   

Problem:  
What is the difference between selected and highlighted status in a tableView or collectionView?

In Apple documentation, it only says that highlight and selection would affect the appearance of the cell. It doesn't point out the difference between them clearly.

Answer:  
I found this answer in a book about the techniques of collectionView. It says,
> The cell has two Boolean properties of importance: selected and highlighted. The highlighted state depends completely on the user interaction; when the user has her finger **pressed down** on a cell, it becomes highlighted automatically. Cell selection is less transient; cells become selected (if their collection view supports selection) when the user **lifts her finger**.

# Reference
* Great Book [iOS UICollectionView: The Complete Guide ](https://ashfurrow.com/uicollectionview-the-complete-guide/)  
