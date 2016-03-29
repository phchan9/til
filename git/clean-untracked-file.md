# Clean Untracked File
:notebook:  
Scenario: Sometimes, there are some file created which we don't want to keep.

Sol:  
Use `git clean` command to empty our working directory.
```bash
  $ git status
  On branch master
  Untracked files:
    (use "git add <file>..." to include in what will be committed)

  	HRTrackingTitleView/
  	rss_reader.rb

  nothing added to commit but untracked files present (use "git add" to track)
```
Use `-n` execute dry-run to show which files would be removed, which miss directories. Add `-d` to show info about directories.
```bash
  $ git clean -n
  Would remove rss_reader.rb
  $ git clean -n -d
  Would skip repository HRTrackingTitleView/
  Would remove rss_reader.rb
```
If clean.requireForce is set to "true" (the default) in your configuration, then unless you specify -f nothing will actually happen.
```bash
  $ git clean
  fatal: clean.requireForce defaults to true and neither -i, -n, nor -f given; refusing to clean
  $ git clean -f # without `-d`, won't clean directories
  Removing rss_reader.rb
  $ git status
  On branch master
  Untracked files:
    (use "git add <file>..." to include in what will be committed)

  	HRTrackingTitleView/

  nothing added to commit but untracked files present (use "git add" to track)
  $ git clean -f -d HRTrackingTitleView/
  $ git status
  On branch master
  nothing to commit, working directory clean
```
# Reference
* [stackoverflow](http://stackoverflow.com/questions/61212/how-do-i-remove-local-untracked-files-from-my-current-git-branch)
