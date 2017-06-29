require 'spec_helper'

describe Roboto::ContentProvider do
  include FakeFS::SpecHelpers

  let(:content_provider) { Roboto::ContentProvider.new }
  let(:relative_robots_dir) { 'config/robots' }

  let(:relative_path_to_default) do
    "#{relative_robots_dir}/default.txt"
  end

  before(:each) do
    FileUtils.mkdir_p(Roboto::Engine.root.join(relative_path_to_default))
    FileUtils.mkdir_p(Rails.root.join(relative_robots_dir))
  end

  it 'uses the environment specific file if found' do
    path = Rails.root.join("config/robots/test.txt")
    File.open(path, 'wb') { |f| f.write(Rails.env) }
    expect(content_provider.path).to eq(path)
    expect(content_provider.contents).to eq(Rails.env)
  end

  it 'supports erb pre-processing' do
    path = Rails.root.join("config/robots/test.txt.erb")
    File.open(path, 'wb') { |f| f.write('<%= Rails.env %>') }
    expect(content_provider.path).to eq(path)
    expect(content_provider.contents).to eq(Rails.env)
  end

  it 'strips newlines in closing erb tags' do
    path = Rails.root.join("config/robots/test.txt.erb")
    File.open(path, 'wb') { |f| f.write("<% if true %>\n<%= Rails.env %>\n<% end %>") }
    expect(content_provider.path).to eq(path)
    expect(content_provider.contents).to eq(Rails.env)
  end

  it 'uses the default robots file if found in the rails root' do
    path = Rails.root.join(relative_path_to_default)
    FileUtils.touch(path)
    expect(content_provider.path).to eq(path)
  end

  it 'defaults to the gem provided robots if not found in rails root' do
    path = Roboto::Engine.root.join(relative_path_to_default)
    FileUtils.touch(path)
    expect(content_provider.path).to eq(Roboto::Engine.root.join(relative_path_to_default))
  end
end

