# Roboto

[![Build Status](https://secure.travis-ci.org/LaunchWare/roboto.png)](http://travis-ci.org/LaunchWare/roboto)

Roboto is a Rails Engine that gives you the ability to specify enviornment specific robots in your Rails 4.2+ application.

Don't let crawlers access your staging environment. This is [bad for SEO](http://www.seomoz.org/learn-seo/duplicate-content).

## Installing
You can add it to your Gemfile with:

```
gem 'roboto'
```

After you need to run the generator:
```
#>  rails generate roboto:install
```

If you already have robots.txt, it will be kept for your production environment in config/robots/production.txt

You can now specify environment specific robots.txt files in config/robots/.
By default crawlers are disallow from accessing your site has been made for all your environments.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

