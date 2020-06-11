class UsersController < ApplicationController
  require'pry'
  # before_action :authorization_required, only: [:new, :create]
  before_action :current_user
  #loads signup form
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

#  def show
# #    byebug
#    @user = User.find_by(id: params[:id])
#     # @review = Review.new
#  end

 def show
  # @user = User.find_by(id: params[:id])
  @user = current_user
 end

 private

  def user_params
    params.require(:user).permit( :name, :email, :password
    )
  end
end







