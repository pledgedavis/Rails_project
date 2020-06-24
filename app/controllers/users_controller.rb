class UsersController < ApplicationController
  require'pry'
  before_action :current_user 
 def new
   @user = User.new
 end

 def create
    @user = User.new(user_params)
    # byebug
    if @user.valid?  
      @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
      render :new
  end     
 end
 
 def index
  redirect_to "/"
 end

 def show
  @user = current_user
 end

 private

 def user_params
    params.require(:user).permit( :name, :email, :password
    )
 end
end







