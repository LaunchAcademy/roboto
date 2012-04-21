module Roboto
  #A Rails Engine for managing environment specific robots.txt files
  class Engine < Rails::Engine
    isolate_namespace Roboto

    initializer "roboto rounting" do
      require "roboto/routing"
      ActionDispatch::Routing::Mapper.send(:include, Roboto::Routing)
    end
  end
end
