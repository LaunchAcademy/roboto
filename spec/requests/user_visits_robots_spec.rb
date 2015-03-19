require 'spec_helper'

feature 'user/bot visits robots.txt', %q{
  As a bot
  I want to see a robots.txt file for my application
  So I know what to crawl and what not to crawl
} do

  feature 'with default config' do   
    scenario "visit robots.txt" do      
      visit "/robots.txt"
      page.status_code.should eql(200)
      expect(page.response_headers).to include("Cache-Control")
      expect(page.response_headers["Cache-Control"]).to eq(disabled_cache_response)
    end
  end

  feature "with cache enabled and default config" do
    background do
      Roboto.configure do |config|
        config.cache = true
      end
    end

    scenario "visit robots.txt" do
      visit "/robots.txt"
      page.status_code.should eql(200)
      expect(page.response_headers).to include("Cache-Control")
      expect(page.response_headers["Cache-Control"]).to eq(cache_response_sample)
    end
  end

  feature "with cache enabled and alternative config" do
    background do
      Roboto.configure do |config|
        config.cache = true
        config.cache_expires_in = 10.years
        config.cache_public = true
      end
    end

    scenario "visit robots.txt" do
      visit "/robots.txt"
      page.status_code.should eql(200)
      expect(page.response_headers).to include("Cache-Control")
      expect(page.response_headers["Cache-Control"]).to eq(cache_response_sample(10.years, true))
    end
  end

  feature "with cache enabled but only in production" do
    background do
      Roboto.configure do |config|
        config.cache = true
        config.cache_expires_in = 10.years
        config.cache_public = true
        config.cache_only_in_production = true
      end
    end

    scenario "visit robots.txt with cache true and alternative config" do
      visit "/robots.txt"
      page.status_code.should eql(200)
      expect(page.response_headers).to include("Cache-Control")
      expect(page.response_headers["Cache-Control"]).to eq(disabled_cache_response)
    end
  end

  def cache_response_sample(max_age=1.year, public=false)
    "max-age=#{max_age.to_i}, #{public ? 'public' : 'private'}"
  end

  def disabled_cache_response
    "max-age=0, private, must-revalidate"
  end
end
