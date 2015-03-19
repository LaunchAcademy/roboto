require 'spec_helper'
require 'generators/roboto/install_generator'

describe Roboto::Generators::InstallGenerator do
  destination File.expand_path("../../../dummy_generator", __FILE__)

  before {prepare_destination}

  describe 'presence of roboto configuration files' do
    before do
      @env_availabe = ["roboto_env", "staging", "production"]
      create_fake_env
      create_routes_rb
      run_generator
    end

    ["roboto_env", "staging", "production"].each  do |env|
       describe 'config/robots/#{env}.txt' do
        subject { file("config/robots/#{env}.txt") }
        it { should exist }
        it { should contain "User-Agent: *" }
        it { should contain "Disallow: /" }
      end
    end

    describe 'config/routes.rb' do
      subject { file('config/routes.rb') }
      it { should exist }
      it { should contain "mount_roboto" }
    end

    describe 'config/initializers/roboto.rb' do
      subject { file('config/initializers/roboto.rb') }
      it { should exist }
      it { should contain "config.cache" }
      it { should contain "config.cache_only_in_production" }
      it { should contain "config.cache_expires_in" }
      it { should contain "config.cache_public" }
    end
  end

  def create_routes_rb
    routes = File.expand_path("../../../dummy/config/routes.rb", __FILE__)
    destination = File.join(destination_root, "config")
    FileUtils.mkdir_p(destination)
    FileUtils.cp routes, destination
  end

  def create_fake_env
    destination = File.join(destination_root, "config/environments")
    FileUtils.mkdir_p(destination)
    @env_availabe.each {|env|  FileUtils.touch(destination_root + "/config/environments/#{env}.rb")}
  end
end