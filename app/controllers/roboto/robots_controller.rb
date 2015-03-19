module Roboto
  class RobotsController < Roboto::ApplicationController
    after_action :set_cache_headers, if: -> { Roboto.configuration.cache }

    def show
      render :text => robot_contents,
        :layout => false,
        :content_type => 'text/plain'
    end

    protected
    def robot_contents
      # process erb template in the context of this controller request
      Roboto::ContentProvider.new.contents(binding)
    end

    def robots_path
      Rails.root.join("config/robots/#{Rails.env}.txt")
    end

    def default_robots
      [
        Rails.root.join("config/robots/#{Rails.env}.txt"),
        Rails.root.join(default_path),
        Roboto::Engine.root.join(default_path)
      ].each do |path|
        return path if FileTest.exists?(path)
      end
    end

    private
    def set_cache_headers
      if !Roboto.configuration.cache_only_in_production || Rails.env.production?
        expires_in Roboto.configuration.cache_expires_in, public: Roboto.configuration.cache_public
      end
    end
  end
end

