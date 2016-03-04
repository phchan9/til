# How to get the app size

Get into magic path where app bundle located after building in Xcode.
Use command line to figure out the size in this bundle.

```bash
$ # show the total size about nib files
$ du -ch *.nib
$ # show the total size about provisioning
$ du -ch *.png
$ # show the total size of this bundle
$ du -sh .
```
# Reference
* [apple documentation](https://developer.apple.com/library/ios/qa/qa1795/_index.html)
* [stackoverflow](http://stackoverflow.com/questions/4446367/what-is-the-easiest-way-to-determine-an-ios-app-bundles-size-while-developing)
* [blog](http://www.indiepinion.com/steffenj/how-to-calculate-the-size-of-an-iphone-app-after-approval/)
