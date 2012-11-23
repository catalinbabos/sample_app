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
      sign_in user
      redirect_to user
  	end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
