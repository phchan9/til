# Undo rebase or reset incorrectly

Sometimes we might rebase onto another branch and it turns out that some conflict or ignored commits aren't handled expectedly or we reset the head to wrong commit. Therefore, we use `git reflog` to fix it with `git reset`.

# What is Git Reflog
The command ,`git reflog`, lists out all updates to the tip of branches, which means it tracks all change of your current *HEAD*. It is shown like this:

```
24f1828 HEAD@{0}: commit: rename the file to *.md
d1bb972 HEAD@{1}: commit: add arc best practice reference
85d0329 HEAD@{2}: reset: moving to HEAD~1
e0ba686 HEAD@{3}: reset: moving to HEAD@{2}
fdaed81 HEAD@{4}: reset: moving to HEAD~1
```

You can see several change related to reset commit which was some mistake I did. Then, we can use `git reset --hard HEAD@{%d}` to undo it.


# Reference
* [atlassian git reflog  ](https://www.atlassian.com/git/tutorials/rewriting-history/git-reflog)
* [questions on stackoverflow](http://stackoverflow.com/questions/134882/undoing-a-git-rebase)
