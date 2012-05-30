module Roboto
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Roboto locale files to your application."

      def copy_locale
        empty_directory "config/robots"
        copy_file "robots.txt", "config/robots/production.txt" unless FileTest.exists?("public/robots.txt")
        copy_file "robots.txt", "config/robots/staging.txt"
        copy_file "robots.txt", "config/robots/development.txt"
      end

      def deplace_old_robot
        if FileTest.exists?("public/robots.txt")
          copy_file File.join(destination_root + "/public/robots.txt"), "config/robots/production.txt"
          remove_file "public/robots.txt"
        end
      end

      def add_roboto_route
        # special tricks for test generator with ammeter
        # is launch in clean folder without nothing
        unless FileTest.exist?(File.join(destination_root + "config"))
          empty_directory "config"
          create_file("config/routes.rb")
        end
        route "mount_roboto"
      end

      def show_readme
        readme "README"
      end
    end
  end
end
