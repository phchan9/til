# Search git log

When I'm working on a huge project and have no time to checkout a bunch of source files, I need to search some commit I really cared about.
Therefore, the following search tips made my job easier.


## Commits about the specific file
We can use `git log` with `-<n>` options to limit its output and use filename to
search the specific files. For example, I want
to know the recent 2 commits about README.md in this project.
```diff
# template: git log -p -<n> <filename>
$ git log -p -2 README.md
commit d5f8e8db4dcb6cd66b470ff0527d30d346775c35
Author: phchang <phchang@yahoo.com.tw>
Date:   Tue Jan 5 22:41:48 2016 +0800

    add undo-rebase-or-reset-incorrectly.md

diff --git a/README.md b/README.md
index 40d0040..0264fee 100644
--- a/README.md
+++ b/README.md
@@ -8,8 +8,13 @@ In order to keep myself learning and better, I write notes which I learn day by
 - [Swift](#swift)
 - [Ruby](#ruby)
 - [Rails](#rails)
+- [Git](#git)



 ### iOS
-- [Weak Reference Issue](ios/weak-reference-issue)
+- [Weak Reference Issue](ios/weak-reference-issue.md)
+
+
+### Git
+- [Undo rebase or reset incorrectly](git/undo-rebase-or-reset-incorrectly.md)

commit 85d0329a09044417e234a8a9ff340650e7533ace
Author: phchang <phchang@yahoo.com.tw>
Date:   Tue Jan 5 17:02:55 2016 +0800

    add weak reference issue for ios

diff --git a/README.md b/README.md
index c5f2e2b..40d0040 100644
--- a/README.md
+++ b/README.md
@@ -12,3 +12,4 @@ In order to keep myself learning and better, I write notes which I learn day by


 ### iOS
+- [Weak Reference Issue](ios/weak-reference-issue)
```
With options `-p`, we can see more detail about our update. We can also use `git log -- <filename>` to show all the commit log about your files.


## Grep the diff of your commits
Use `-S"<string>"` to grep some lines in your source code.
```diff
# template: git log -S"string"
$ git log -S"__weak"
phchang@burpnowrest-lm [12:10:54] [~/Documents/logdown_blog/til] [master]
commit 24f18281a38f01aa0578335bd5373b7123587e99
Author: phchang <phchang@yahoo.com.tw>
Date:   Tue Jan 5 22:09:54 2016 +0800

    rename the file to *.md

diff --git a/ios/weak-reference-issue b/ios/weak-reference-issue
deleted file mode 100644
index fc84eff..0000000
--- a/ios/weak-reference-issue
+++ /dev/null
@@ -1,27 +0,0 @@
-# Weak Reference Issue
-
-We often used `__weak` to prevent the retain cycle problem in a block,
-but it occurs another issue that weak variable would be `nil` if the
-object pointed originally by weak variable released during we use it in block.
-To fix this , we declare one more variable in block to
-to retain the weak variable:
.........
```

## Grep your commit message
Use `--grep="string"` to find commit message yo interested in.

```diff
# template: git log -p --grep="string"
$ git log -p --grep="arc"
phchang@burpnowrest-lm [12:21:27] [~/Documents/logdown_blog/til] [master]
commit d1bb972672f6d1cb78a499b36f1ff3618e05956a
Author: phchang <phchang@yahoo.com.tw>
Date:   Tue Jan 5 22:08:16 2016 +0800

    add arc best practice reference

diff --git a/ios/weak-reference-issue b/ios/weak-reference-issue
index 3b6de00..fc84eff 100644
--- a/ios/weak-reference-issue
+++ b/ios/weak-reference-issue
@@ -24,3 +24,4 @@ __weak typeof(self) weakSelf = self;
 ### Reference
 * [strongSelf vs weakSelf](https://dhoerl.wordpress.com/2013/04/23/i-finally-figured-out-weakself-and-strongself/)
 * [issue with __block and __weak](http://honglu.me/2015/01/06/weak%E4%B8%8Eblock%E5%8C%BA%E5%88%AB/)
+* [arc best practice](http://amattn.com/p/arc_best_practices.html)
```

## Reference
* [atlassian tutorials](https://www.atlassian.com/git/tutorials/git-log/filtering-the-commit-history/)
