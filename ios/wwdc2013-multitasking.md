# Note About WWDC 2013 - What's new multitasking

:notebook:    

An iOS7 App now can works in background mode using: **background fetch**, **remote notification**
and **background transfer service**. Some battery policy about background work update.(which should check out the wwdc video to learn more detail)


# Background Fetch
* set minimum interval to fetch content routinely
* could be tested by the new feature, simulate background fetch, in the simulator or edit the scheme to let app launch due to background fetch event
* only have 30 secs to process the fetch work and call the completion handler for iOS to record some digits


# Remote Notification
* silent notification - contains no alert message and used to notify some event or trigger some background work.


# Background Transfer service
* could do heavy work which background fetch and remote notification can't do.
* could use with a new release class `NSURLSession` to handle background transfer service.
* when app is in background mode, it needs more preparation to do with `NSURLSessionDownloadTask`.
* check out objc blog post with more information.

# Note
* Does OS relaunch the app when the app gets the push notification or needs to background fetch?   
The answer from apple employee ,
>  Also keep in mind that if you kill your app from the app switcher (i.e. swiping up to kill the app) then the OS will never relaunch the app regardless of push notification or background fetch. In this case the user has to manually relaunch the app once and then from that point forward the background activities will be invoked. -pmarcos

* What difference between `application:didReceiveRemoteNotification:` and `application:didReceiveRemoteNotification:fetchCompletionHandler:` methods?
According to apple documentation,
> Use this method to process incoming remote notifications for your app. Unlike the application:didReceiveRemoteNotification: method, which is called only when your app is running **in the foreground**, the system calls this method when your app is running **in the foreground or background**. In addition, if you enabled the remote notifications background mode, the system launches your app (or wakes it from the suspended state) and puts it in the background state when a remote notification arrives. However, **the system does not automatically launch your app if the user has force-quit it**. In that situation, the user must relaunch your app or restart the device before the system attempts to launch your app automatically again.


# Reference
* [objc post](https://www.objc.io/issues/5-ios7/multitasking/#testing-background-fetch)
* [WWDC 2013](https://developer.apple.com/videos/play/wwdc2013/204/)
* [stackvoverflow](http://stackoverflow.com/questions/19068762/will-ios-launch-my-app-into-the-background-if-it-was-force-quit-by-the-user/19202487#19202487)
