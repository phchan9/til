# Difference Between Xcode Project And Xcode Workspace
:notebook:  

Scenario:   
After we installed project dependency by `pod install`, we need to open xcode workspace file instead
of xcode project file. But why do we need the this workspace file? what's the difference between them?

First of all, what is workspace file?
The brief answer from stackoverflow,
> A workspace is a collection of projects. It's useful to organize your projects when there's correlation between them  

it is like a more high level to organize dependency between your project and dependency library.

And according to cocoapods documentation,
>  CocoaPods recursively resolves dependencies between libraries, fetches source code for all dependencies, and creates and maintains an Xcode **workspace** to build your project.



# Reference
* [stackoverflow](http://stackoverflow.com/questions/21631313/xcode-project-vs-xcode-workspace-differences)
* [some blog](http://www.peachpit.com/articles/article.aspx?p=2118332)
