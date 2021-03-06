class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :isAdmin?, :only => [:destroy]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 5)
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
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "User updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, :flash => { :success => "User #{@user.name} deleted." }
    else
      render users_path, :flash => { :error => "User deletion failed." }
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to current_user, :flash => { :notice => "Access Denied." }
      end 
    end
end
