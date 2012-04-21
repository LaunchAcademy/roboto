# Roboto

[![Build Status](https://secure.travis-ci.org/LaunchWare/roboto.png)](http://travis-ci.org/LaunchWare/roboto)

Roboto is a Rails Engine that gives you the ability to specify enviornment specific robots in your Rails 3.1+ application.

Don't let crawlers access your staging environment. This is [bad for SEO](http://www.seomoz.org/learn-seo/duplicate-content).

## Installing

First, remove the default, generate robots.txt in your Rails App

```
  #> rm public/robots.txt
```

Next, add roboto to your gemfile:

```
  gem 'roboto'
```

Then, add robot to your routes (config/routes.rb):

```
  Rails.application.routes.draw do
    mount_roboto
  end
```

You can now specify environment specific robots.txt files in config/robots.

It's recommended for staging that you do disallow crawlers from accessing your site. Once you've created a separate Rails environment for staging, define a config/robots/staging.txt file like so:

```
  #place this in config/robots/staging.txt
  User-Agent: *
  Disallow: /
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

