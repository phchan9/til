# Switch RVM To rbenv
:notebook:   
After reading wiki in rbenv repo, rbenv is more clean and clear for me in contrast with RVM which would override shell default command `cd` and require some prompt hack. RVM might also maintain lots of gems with gemsets swallowing my disk space.

### Remove RVM
```bash
  $ rvm implode
```
### Install rbenv
```bash
  $ homebrew update && homebrew install rbenv
```
NOTE: If use homebrew to install `rbenv`, it will install `ruby-build` for you automatically.
### Install Ruby
```bash
  $ rbenv install -l
  ....
  2.2.2
  2.2.3
  2.2.4
  2.3.0-dev
  2.3.0-preview1
  2.3.0-preview2
  2.3.0
  2.4.0-dev
  ...
  $ rbenv install 2.3.0
  $ rbenv global 2.3.0 # set default ruby version to 2.3.0
  $ rbenv init
  # Load rbenv automatically by appending
  # the following to ~/.zshrc:

  eval "$(rbenv init -)"
  $ echo "eval \"\$(rbenv init -)\"" >> ~/.zshrc
  $ source ~/.zshrc
  $ ruby -v
  ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
```

### Install bundler
```bash
  $ gem install bundler
  $ # we can use `gem env home` to show where our gems install at
  $ gem env home
  /Users/phchang/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0
```

# Reference
* [blog](https://robots.thoughtbot.com/using-rbenv-to-manage-rubies-and-gems)
* [rbenv repo](https://github.com/rbenv/rbenv#installation)
