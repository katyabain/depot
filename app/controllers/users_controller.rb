class UsersController < ApplicationController
 before_filter :authenticate, :only => [:index, :edit, :update]
 before_filter :correct_user, :only => [:edit, :update] 
 before_filter :admin_user, :only => [:index, :destroy]
  # GET /users
  # GET /users.xml
  def index
  @title = "All users"
  @users = User.all
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @title = "Sign Up"
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
      if @user.save
     sign_in @user
     flash[:success] = "Welcome to Superfranklin, #{@user.name}!"
     redirect_to user_path(@user) 
      else
       @title = "Sign Up"
       render 'new'
      end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
       if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        redirect_to @user
        else
          @title = "Edit user"
          render 'edit'
      end
    end


  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])   
  begin
    @user.destroy
    flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
    flash[:notice] = e.message
    redirect_to users_path
  end
  end

private

def authenticate
 deny_access unless signed_in?
end

def correct_user
 @user = User.find(params[:id])
 redirect_to(root_path) unless current_user?(@user)
end

def admin_user
 redirect_to(root_path) unless current_user.admin?
end

end
