# Statement Expressions In Objc
:notebook:   

When reading some source code on github, I found some interesting expression in objc code:   
```objc
[self.view addSubview:self.backgroundView = ({
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView;
})
```
The benefits from this expression concluded in stackoverflow questions:
> There's a lot of advantages to this construct for initialization:
* clear and concise
* configuration details in the initialization
* scope is smaller
* generic variable names can be reused

IMO, this expression makes our massive `viewDidLoad` function, which often contains lots of ui initialization code snippets, more organized and clear

# Reference
* [stackoverflow](http://stackoverflow.com/questions/20863152/using-a-gcc-c-extension-statement-expressions-in-objective-c-for-initializatio)
