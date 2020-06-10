class SessionsController < ApplicationController
 
  def home
  end

  def new
    @user = User.new
   render :login
  end

  def create 
      @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
              session[:user_id] = @user.id
              redirect_to user_path(@user)
      else
        flash[:error] = "Incorrect username or password try again! "
        redirect_to '/login'
    end
  end
 
   #omniauth
  def fbcreate 
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid'] #Secure Random Hex
    end
 
    session[:user_id] = @user.id
 
    redirect_to '/places'
  end

  def home
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = "User logged out"
    redirect_to '/' 
      #  session.clear
      # redirect_to '/' 
  end

  def auth
    request.env['omniauth.auth']
  end
end