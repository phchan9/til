# Check Out the Disk Usage Of RVM
:notebook:  

Just wondering how much data size and gemsets maintained by RVM?
Use `rvm disk-usage` to check it out. According to documentation from CLI,   
> \## Usage    
rvm disk-usage {all,total,archives,docs,repos,sources,logs,pkg,rubies,gemsets,wrappers,tmp,others}'
Shows the amount of disk space used by a specific set of data associated with rvm.
    `all` returns each, individually, along with the total space used.

I use options, `all`, to show each items clearly.
```
-> % rvm disk-usage all
   Downloaded Archives Usage: 29M
          Repositories Usage: 0B
 Extracted Source Code Usage: 142M
             Log Files Usage: 1.4M
              Packages Usage: 0B
                Rubies Usage: 123M
               Gemsets Usage: 1.4G
              Wrappers Usage: 56K
       Temporary Files Usage: 0B
           Other Files Usage: 4.9M
            Total Disk Usage: 1.7Gbash

```
NOTE: Maybe it's time to migrate **rvm** to **rbenv**.


# Reference
* help message in your command line
