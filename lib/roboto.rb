require 'gem_config'
require 'roboto/version'
require 'roboto/engine'
require 'roboto/content_provider'

#container for Roboto related functions
module Roboto
  include GemConfig::Base

  with_configuration do
    has :cache, classes: [TrueClass, FalseClass], default: false
    has :cache_expires_in, classes: Float, default: 1.year
    has :cache_only_in_production, classes: [TrueClass, FalseClass], default: false
    has :cache_public, classes: [TrueClass, FalseClass], default: false
  end
end

