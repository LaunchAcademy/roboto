require 'spec_helper'

feature 'user/bot visits robots.txt', %q{
  As a bot
  I want to see a robots.txt file for my application
  So I know what to crawl and what not to crawl
} do

  scenario "visit robots.txt" do
    visit "/robots.txt"
    page.status_code.should eql(200)
  end
end

