# Show Xcode Build Env Variable
:notebook:  

Scenario:   
Just found some environment variable in the build phase tab (or other tabs) in Xcode project setting and what do these variables mean?

Solution:    
When we work with a workspace ,use the command `xcrun xcodebuild -workspace XXXXX.xcworkspace -scheme XXXXX -showBuildSettings` to show these variables.


Other than workspace, we use `-project` options with project like `xcrun xcodebuild -project myProj.xcodeproj -target "myTarg" -showBuildSettings`

# Reference
* [stackoverflow](http://stackoverflow.com/questions/6910901/how-do-i-print-a-list-of-build-settings-in-xcode-project)
