require 'spec_helper'
require 'generators/roboto/install_generator'

describe Roboto::Generators::InstallGenerator do
  destination File.expand_path("../../../dummy_generator", __FILE__)

  before {prepare_destination}

  describe 'presence of roboto configuration file' do
    before do
      @env_available = ["roboto_env", "staging", "production"]
      create_fake_env
      create_routes_rb
      run_generator
    end

    ["roboto_env", "staging", "production"].each  do |env|
       describe 'config/robots/#{env}.txt' do
        subject { file("config/robots/#{env}.txt") }
        it { is_expected.to exist }
        it { is_expected.to contain "User-Agent: *" }
        it { is_expected.to contain "Disallow: /" }
      end
    end

    describe 'config/routes.rb' do
      subject { file('config/routes.rb') }
      it { is_expected.to exist }
      it { is_expected.to contain "mount_roboto" }
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
    @env_available.each {|env|  FileUtils.touch(destination_root + "/config/environments/#{env}.rb")}
  end
end
