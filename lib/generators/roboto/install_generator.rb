module Roboto
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Roboto locale files to your application."

      def copy_locale
        empty_directory "config/robots"
        env_list = Dir.glob("#{destination_root}/config/environments/*")
        env_list.each do |env_file|
          env_name = File.basename(env_file, ".rb")
          unless (env_name == "production" &&  FileTest.exists?("public/robots.txt"))
            copy_file "robots.txt", "config/robots/#{env_name}.txt"
          end
        end
        if FileTest.exists?("public/robots.txt")
         copy_file File.join(destination_root + "/public/robots.txt"), "config/robots/production.txt"
         remove_file "public/robots.txt"
        end
      end

      def add_roboto_route
        route "mount_roboto"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
