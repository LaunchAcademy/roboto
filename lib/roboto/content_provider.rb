module Roboto
  class ContentProvider
    def contents
      @contents ||= File.read(path)
    end

    def path
      lookup_paths.each do |f|
        if FileTest.exist?(f)
          return f
        end
      end

      #this should never occur because we define a default in the gem
      raise "Robots file not found"
    end

    protected
    def lookup_paths
      [
        Rails.root.join("config/robots/#{Rails.env}.txt"),
        Rails.root.join(relative_path_to_default),
        Roboto::Engine.root.join(relative_path_to_default)
      ]
    end

    def relative_path_to_default
      "config/robots/default.txt"
    end
  end
end

