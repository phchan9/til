# Injection For Xcode
:notebook:  

After I learned from orta's post , we can use injection with Xcode to speed up our developing
process when it takes us a long time to build app. See details in orta's post or
github page.

We can also injection into our devices which is really powerful. However, there are
still a few drawbacks like we cannot inject the nib file. It only inject with objc class
and storyboard(which I don't try it yet).

NOTE:
If have any code sign error issue, we can refer to this [issue](https://github.com/johnno1962/injectionforxcode/issues/41)
, which need to set the CODE_SIGN_IDENTITY into our injection bundle.

# Reference
* [injectionforxcode repo](https://github.com/johnno1962/injectionforxcode)
* [orta's post](http://artsy.github.io/blog/2016/03/05/iOS-Code-Injection/)
