class ApplicationController < ActionController::Base
    include ApplicationHelper
    # before_action :redirect_if_not_logged_in 
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :authorized_to_edit?
    
    private 

#   def authorization_required
#     if !logged_in?
#       redirect_to '/'
#     end
#   end 
#   def redirect_if_not_logged_in
#     redirect_to login_path if !logged_in?
#   end

#   def current_user 
#     @current_user ||= User.find_by_id(session[:user_id])
#    #  if session[:user_id]
#   end 
#  end

 def logged_in?
  !!session[:user_id]
 end

 def current_user
  @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
 end

 def authorized_to_edit?(p)
  p.user == current_user
 end  
# def redirect_if_not_logged_in
#   redirect_to login_path if !logged_in?
# end
end