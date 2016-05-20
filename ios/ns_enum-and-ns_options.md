# NS_ENUM and NS_OPTIONS
:notebook:  

We can use enumerations to give readable names in our code, such as status code, error code and some bitmask, which we can see examples in UIKit like `UIViewAutoresizingFlexibleWidth`, `UIViewAutoresizingFlexibleHeight`.

Take the pod `SDWebImage` as an example,
```Objc
// SDImageCache.h
typedef NS_ENUM(NSInteger, SDImageCacheType) {
    /**
     * The image wasn't available the SDWebImage caches, but was downloaded from the web.
     */
    SDImageCacheTypeNone,
    /**
     * The image was obtained from the disk cache.
     */
    SDImageCacheTypeDisk,
    /**
     * The image was obtained from the memory cache.
     */
    SDImageCacheTypeMemory
};


// SDWebImageManager.h
typedef NS_OPTIONS(NSUInteger, SDWebImageOptions) {
    SDWebImageRetryFailed = 1 << 0,
    SDWebImageLowPriority = 1 << 1,
    SDWebImageCacheMemoryOnly = 1 << 2,
    SDWebImageProgressiveDownload = 1 << 3,
    SDWebImageRefreshCached = 1 << 4,
    SDWebImageContinueInBackground = 1 << 5,
    SDWebImageHandleCookies = 1 << 6,
    SDWebImageAllowInvalidSSLCertificates = 1 << 7,
    SDWebImageHighPriority = 1 << 8,
    SDWebImageDelayPlaceholder = 1 << 9,
    SDWebImageTransformAnimatedImage = 1 << 10,
    SDWebImageAvoidAutoSetImage = 1 << 11
};
```

According to book, Effective Objective-C, it points out that we should declare enumerations with an explicit type rather than compilers choose for you implicitly.
Additionally, we can gain the benefits when we use switch statement with enumerations.
> “Do not implement a default case in switch statements that handle enumerated types. This helps if you add to the enumeration, because the compiler will warn that the switch does not handle all the values.”

# Reference
* [NSHipster post](http://nshipster.com/ns_enum-ns_options/)
* book: [Effective Objective-C: Item 5 "Use Enumerations for States, Options, and Status Codes"](http://www.amazon.com/Effective-Objective-C-2-0-Specific-Development/dp/0321917014)
* [github: rs/SDWebImage](https://github.com/rs/SDWebImage)
