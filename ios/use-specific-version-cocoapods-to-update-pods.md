# Use specific version cocoapods to install
:notebook:   

Scenario:   
Although cocoapods has the new beta version(1.0.0.beta.3), I still wanted use `0.38.2`
to update my pods for some dependency issue when there are multiple version gems in my environment.

Solution:  
Use `_X.X.X_` to specify which version to use with this gem.

```bash
-> % gem list | grep cocoapods | head -n 1
cocoapods (0.39.0, 0.38.2)
-> % pod --version
0.39.0
-> % pod _0.38.2_ --version
0.38.2
-> # use cocoapods with 0.38.2 to update pods
-> % pod _0.38.2_ update <PODS_NAME>
```
# Note
Where to find the cocoapods we used last time in this iOS project?    
ans: check out `Podfile.lock`   
```basah
-> % tail -n 2 Podfile.lock

COCOAPODS: 0.38.2
```


# Reference
* [bundler example](http://www.tcias.co.uk/blog/2015/04/07/a-couple-of-bundler-tricks/)
