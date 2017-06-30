module Roboto
  class RobotsController < Roboto::ApplicationController
    def show
      render_sym = Rails.version.split(".")[0].to_i >= 5 ? :plain : :text
      render render_sym => robot_contents,
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


  end
end

