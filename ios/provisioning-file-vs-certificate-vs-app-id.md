# Provisioning file vs Certificate vs App Id
:notebook:  

I usually got confused these things and what difference between a provision file and certificate.
Here are the answers I found:   

identifier:  
> Also referred to as "Application Identifiers" or "Bundle Identifiers".  They uniquely identify your application.  

certificate:   
>  This is a cryptographic certificate granted to you by Apple.  It works just like SSL where you get a certificate signed by an authority.  Apple signs the private key that you use to sign different pieces of your application.  Different certificates create different types of trust.  Some allow you to sign and submit your application for the App Store, while others allow your application's web server to send push notifications to users via APNS.  In the latter case, for instance, Apple uses this certificate to trust the web server sending the push notification.

provisioning file:
> There is one component of the code signing and sandbox machinery that binds signing, entitlements, and the sandbox together: provisioning profiles. A provisioning profile is a collection of all the components needed to determine if a particular app can run on a particular device.  

entitlements:  
> Entitlements specify which resources of the system an app is allowed to use, and under what conditions. Basically, it is a configuration list for the sandbox on what to allow and what to deny your application. This is the XML generated (like a plist file) by Xcode after clicking around in the Capabilities tab and enabling a few things. Xcode automatically generates an .entitlements file and adds entries to it, as needed.


NOTE: we can use `security cms -D -i example.mobileprovision` to look into provision files which is encoded as CMS format file.





# Reference
* [quora answer](https://www.quora.com/What-are-the-differences-between-certificates-provisioning-profiles-and-identifiers)
* [good and detail explanation](http://escoz.com/blog/demystifying-ios-certificates-and-provisioning-files/)
* [objc](https://www.objc.io/issues/17-security/inside-code-signing/)
