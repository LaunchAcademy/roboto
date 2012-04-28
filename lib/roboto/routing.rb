module Roboto
  #convenience methods for Rails routing
  module Routing
    # convenience function for mounting the roboto rails engine to root
    def mount_roboto
      mount Roboto::Engine => "/robots.txt"
    end
  end
end

