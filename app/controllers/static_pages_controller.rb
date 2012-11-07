class StaticPagesController < ApplicationController

  def home
  	@title = "Ruby on Rails Tutorial Sample App | Home"
  end

  def help
  	@title = "Ruby on Rails Tutorial Sample App | Help"
  end

  def about
  	@title = "Ruby on Rails Tutorial Sample App | About Us"
  end
end
