# How To Apply Git Patch Gracefully
:notebook:   
Scenario:   
I needed to apply some patches from others and do the following command in CLI. Then, it happened to me,   
```bash
$ git apply exmaple.patch
error: patch failed: Example.xcodeproj/project.pbxproj:2241
error: Example.xcodeproj/project.pbxproj: patch does not apply
$ git status
On branch phchang-example
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        example.patch

nothing added to commit but untracked files present (use "git add" to track)
```
This output showed that some conflicts in the project with patches but it turned out that project remained the
same without conflicts that you can fix it by hands. Therefore I need to find a way to apply git patches so that the project does have conflict injected. Here is what I found, use `git apply -3` which does the three-way merge,

```bash
$ git apply -3 example.patch
error: patch failed: Example.xcodeproj/project.pbxproj:2241
Falling back to three-way merge...
Applied patch to 'Example.xcodeproj/project.pbxproj' with conflicts.
$ git status
On branch phchang-example
Unmerged paths:
  (use "git reset HEAD <file>..." to unstage)
  (use "git add <file>..." to mark resolution)

        both modified:   Example.xcodeproj/project.pbxproj
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        example.patch
```

NOTE: we can use `git apply --check <patch file>` to show how this apply turns out with a dry run.


# Reference
* [stackoveflow](http://stackoverflow.com/questions/16190387/when-applying-a-patch-is-there-any-way-to-resolve-conflicts)
* [answer about --reject in stackoverflow](http://stackoverflow.com/questions/25846189/git-am-error-patch-does-not-apply)
* [blog explanation](https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/)
