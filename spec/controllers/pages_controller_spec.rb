require 'spec_helper'

describe "pages" do
  
  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/'
      page.should have_content('Sample App')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/'
      page.should have_content('Help')
    end
  end
end
