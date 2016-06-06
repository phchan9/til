# Alias a Branch In Git
:notebook:   

Problem:   
Sometimes I got a long branch name to check out or merge, how can I do the same thing without this struggling?

Answer:   
Use symbolic ref by commandline, `git symbolic`.
```bash
phchang@mbp [23:57:04] [~/Documents/phchang_til] [thelongbranchnameblablabla *]
-> % git symbolic-ref refs/heads/shortname refs/heads/thelongbranchnameblablabla
phchang@mbp [23:57:44] [~/Documents/phchang_til] [thelongbranchnameblablabla *]
-> % gco master
Switched to branch 'master'
phchang@mbp [23:57:55] [~/Documents/phchang_til] [master *]
-> % gco shortname
Switched to branch 'shortname'
phchang@mbp [23:57:44] [~/Documents/phchang_til] [thelongbranchnameblablabla *]
-> %

```

# Reference
* [stackoverflow: Is it possible to alias a branch in Git?](http://stackoverflow.com/questions/549920/is-it-possible-to-alias-a-branch-in-git)
* [atlassian tutorial: Refs and the Reflog](https://www.atlassian.com/git/tutorials/refs-and-the-reflog)
