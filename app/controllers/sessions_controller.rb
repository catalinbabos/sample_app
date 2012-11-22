class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:user][:email], params[:user][:password])
  	if user.nil?
  	  flash.now[:error] = "Invalid email / password combination."	
  	  render "new"
  	else
      # Handle sign in
  	end
  end

  def destroy
  end
end
