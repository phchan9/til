# How To Append Preference To Setting Bundle At The Runtime
:notebook:    
Scenario:   
I want to add debug preference into my app setting bundle.

Solution:  
Use `PlistBuddy`, which is built-in command. Refer to man documentation,
```bash
PLISTBUDDY(8)             BSD System Manager\'s Manual            PLISTBUDDY(8)

NAME
     PlistBuddy -- read and write values to plists

SYNOPSIS
     PlistBuddy [-cxh] file.plist

DESCRIPTION
     The PlistBuddy command is used to read and modify values inside of a plist. Unless specified by the -c switch,
     PlistBuddy runs in interactive mode.

     The following commands are used to manipulate plist data:

     Help        Prints this information.

     Exit        Exits the program. Changes are not saved to the file.

     Save        Saves the current changes to the file.

     Revert      Reloads the last saved version of the file.

     Clear type  Clears out all existing entries, and creates root of type type.  See below for a list of types.

     Print [entry]
                 Prints value of entry.  If an entry is not specified, prints entire file. See below for an explanation of
                 how entry works.
     ...

     Merge file [entry]
            Adds the contents of plist file to entry.

     ...

```
With option `-c` and merge command , we add a run script in build phase to append
our debug plist into `PreferenceSpecifiers` entry in Root.plist, which is required
key in setting bundle. For instance,
```bash
DEBUG_INFOPLIST="$CODESIGNING_FOLDER_PATH/XXXX/Debug.plist"
SETTINGSBUNDLEPATH="$CODESIGNING_FOLDER_PATH/Settings.bundle/Root.plist"

if [ "$CONFIGURATION" == "Debug" ] ; then
/usr/libexec/PlistBuddy -c "Merge $DEBUG_INFOPLIST 'PreferenceSpecifiers'" $SETTINGSBUNDLEPATH

fi
```


# Reference
* [apple documentation](https://developer.apple.com/library/ios/documentation/PreferenceSettings/Conceptual/SettingsApplicationSchemaReference/Articles/RootContent.html)
* [a simple plistbuddy tutorial](http://fgimian.github.io/blog/2015/06/27/a-simple-plistbuddy-tutorial/)
* [IOS-modify-settings-build-phase](http://blog.originate.com/blog/2013/09/05/iOS-modify-settings-build-phase/)
