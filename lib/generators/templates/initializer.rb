Roboto.configure do |config|
  # Enables cache  
  config.cache = false

  # Set max-age of the cache headers
  config.cache_expires_in = 1.year

  # Enable if you only want to cache in production environment
  config.cache_only_in_production = false

  # Set HTTP cache headers to 'public'
  config.cache_public = false
end