= DogFormatter
date format gem

= install

```ruby
$ bundle isntall dog_formatter
```

or 

```Gemfile
gem 'dog_formatter'
```

= usage

```ruby
1 require 'dog_formatter/model'
2
3 class User < ActiveRecord::Base
4 end
```

```ruby
user.created_at_ymd
=> "2016/11/04"
user.created_at_ymd_ja
=> "2016年11月04日"
user.created_at_ym
=> "2016/11"
user.created_at_ym_ja
=> "2016年11月"
```




This project rocks and uses MIT-LICENSE.
