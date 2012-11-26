class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def show
  	@user = User.find(params[:id])
    @title = @user.name
  end

  def new
  	@title = "Sign Up"
  	@user = User.new
  end

  def create 
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
  	else
  	  @title = "Sign Up"
  	  render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "User updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      flash[:notice] = "Access Denied."
      redirect_to(current_user) unless current_user?(@user)
    end
end
