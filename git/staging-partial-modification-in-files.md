# Staging partial modification in files
:notebook:   


Scenario:    
I only need to `git add` a few modifications in the file instead of all modifications
due to make the clear commit for projects.


Solution:   
Use `git add -i` to enter interactive mode and enter `5` which means *patch* command to do the work. Like this,
```diff
$ git add -i
           staged     unstaged path
  1:    unchanged        +1/-0 README.md

*** Commands ***
  1: status       2: update       3: revert       4: add untracked
  5: patch        6: diff         7: quit         8: help
What now> 5
           staged     unstaged path
  1:    unchanged        +1/-0 README.md
Patch update>> 1
           staged     unstaged path
* 1:    unchanged        +1/-0 README.md
Patch update>>
diff --git a/README.md b/README.md
index 2e4f550..bb3ef8f 100644
--- a/README.md
+++ b/README.md
@@ -22,3 +22,4 @@ In order to keep myself learning and better, I write notes which I learn day by
 ### Git
 - [Undo rebase or reset incorrectly](git/undo-rebase-or-reset-incorrectly.md)
 - [Search git log](git/search-git-log.md)
+- [Staging partial modification in files](git/staging-partial-modification-in-files.md)
Stage this hunk [y,n,q,a,d,/,e,?]?
```
When you see the line `Stage this hunk [y,n,q,a,d,/,e,?]?` , you could enter `help` to list more information.

```diff
Stage this hunk [y,n,q,a,d,/,e,?]? help
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
```
I often use `y`/`n` option to stage or not to stage the hunk. Sometimes, I also need the `s` to split the hunk to make it to be line-based to stage and use `e` to manually edit hunk.

NOTE: use `e` option to modify content of staging is more flexible. 
