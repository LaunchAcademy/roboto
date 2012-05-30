require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/roboto/install_generator'

describe Roboto::Generators::InstallGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../dummy_generator", __FILE__)

  before do
    prepare_destination
    copy_routes
  end

  describe 'Test presence of robots.txt' do
    before { run_generator }

    describe 'config/robots/production.txt' do
        subject { file('config/robots/production.txt') }
        it { should exist }
    end

    describe 'config/robots/staging.txt' do
        subject { file('config/robots/staging.txt') }
        it { should exist }
        it { should contain "User-Agent: *" }
        it { should contain "Disallow: /" }
    end

    describe 'config/robots/development.txt' do
        subject { file('config/robots/development.txt') }
        it { should exist }
        it { should contain "User-Agent: *" }
        it { should contain "Disallow: /" }
    end

    describe 'config/routes.rb' do
        subject { file('config/routes.rb') }
        it { should exist }
        it { should contain "mount_roboto" }
    end
  end

  def copy_routes
    routes = File.expand_path("../../../dummy/config/routes.rb", __FILE__)
    destination = File.join(destination_root, "config")

    FileUtils.mkdir_p(destination)
    FileUtils.cp routes, destination
  end
end