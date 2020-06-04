class UsersController < ApplicationController
#loads signup form
 def new
   @user = User.new
 end

 def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to user_path
    else
      render 'new'
  end     
 end
 
 def show
#    byebug
   @user = User.find_by(id: params[:id])

 end


 private

  def user_params
    params.require(:user).permit( :name, :email, :password
    )
  end
end


#   def create
#     if (user = User.create(user_params))
#       session[:user_id] = user.id
#       redirect_to user_path(user)
#     else
#       render 'new'
#     end
#   end

#   def show
#     # byebug
#     @user = User.find_by(id: params[:id])
#   end

#   private

#   def user_params
#     params.require(:user).permit( :name, :height, :nausea, :tickets, :admin, :password, :happiness
#     )
#   end