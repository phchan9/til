# Note About ViewController Containment
:notebook:  

After learning from WWDC session about the view controller containment topic, I'm still curious that
what exactly the methods like `addChildViewController` and `removeFromParentViewController` do.
Therefore I did some experiment to figure it. First, setup some log message in my view controller to see what does it happen.

```objc
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
```

Then I did add a subview of childviewcontroller into root viewcontroller without calling `addChildViewController` method.

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.childVC = [VCChildViewController alloc] init];
    [self.view addSubview:self.childVC.view];
}
```
The log console showed that
```objc

2016-03-11 00:04:40.113 VCContainment[69157:4688892] -[VCParentViewController viewWillAppear:]
2016-03-11 00:04:40.114 VCContainment[69157:4688892] -[VCChildViewController viewWillAppear:]
2016-03-11 00:04:40.116 VCContainment[69157:4688892] -[VCChildViewController viewDidAppear:]
2016-03-11 00:04:40.116 VCContainment[69157:4688892] -[VCParentViewController viewDidAppear:]

```

To compare the above, I did the same thing and call `addChildViewController` method.

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.childVC = [VCChildViewController alloc] init];
    [self addChildViewController:self.childVC];
    [self.childVC didMoveToParentViewController:self];
    [self.view addSubview:self.childVC.view];
}
```

The log console showed that
```objc

2016-03-11 00:03:11.751 VCContainment[68100:4685301] -[VCParentViewController viewWillAppear:]
2016-03-11 00:03:11.752 VCContainment[68100:4685301] -[VCChildViewController viewWillAppear:]
// This time, VCParentViewController's `viewDidAppear` called earlier than VCChildViewController's
2016-03-11 00:03:11.755 VCContainment[68100:4685301] -[VCParentViewController viewDidAppear:]
2016-03-11 00:03:11.755 VCContainment[68100:4685301] -[VCChildViewController viewDidAppear:]
```

Thus, we could find that appearance callback would be called on the right moment with calling method `addChildViewController`. (Of course, it also need to be called with method `didMoveToParentViewController`)    

NOTE: With parent and child relationship between VC, we could access VC.navigationController, VC.parentViewController and VC.childViewControllers properly.

# Reference
* [WWDC 2011 session 102, Implementing UIViewController Containment](https://developer.apple.com/videos/play/wwdc2011/102/)
* [stackoverflow](http://stackoverflow.com/questions/14166006/how-is-a-parent-view-controller-notified-that-iss-child-view-controller-has-rem)
