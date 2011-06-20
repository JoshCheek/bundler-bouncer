bundler-bouncer
===============

Description
-----------

Should your app run in the Bundler sandbox? Well then make sure it is, let bundler-bouncer kick you out of your app if you forgot to `bundle exec` it. Prevents absurdly difficult to find bugs, prevents you from propagating your system with bad data, eases the mind. In the [Pragmatic Programmer](http://pragprog.com/the-pragmatic-programmer/extracts/tips), Dave Thomas and Andy Hunt say to Crash Early, because "The alternative may be to continue, writing corrupted data to some vital database" which, I did, because I wasn't using Bundler on one rake task. Then, later, when I tried to deserialize that data with Bundler running, it was invalid, sending me on a 2 day goose chase trying to figure out what was wrong. Don't let yourself get in my situation, get your app a bouncer.


Features
--------

If you set the environment variable USE_BUNDLER to 'no', it will warn you that it isn't using Bundler, but won't kick you out. This enables you to use tools like [rubygems-bundler](https://rubygems.org/gems/rubygems-bundler).


Usage
-----

Given a Gemfile that looks like this:

    source :rubygems
    gem 'bundler-bouncer', '=0.1.0'

*(don't forget to `bundle install`)*

And a main.rb that looks like this:

    require "bundler/bouncer"
    puts "hello world"

When you run `bundle exec ruby main.rb`, your app will print `hello world`, just like you'd expect.


But when you forget, and run `ruby main.rb` You will get bounced out:

    Try running this app again with `bundle exec`


Recommendation
--------------

Stick it at the top of your Rakefile.
    

Install
-------

`$ gem install bundler-bouncer`
