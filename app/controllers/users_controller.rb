class UsersController < ApplicationController

  def show
  	@title = @user.name
  	@user = User.find(params[:id])
  end

  def new
  	@title = "Sign Up"
  	@user = User.new

  end
end
