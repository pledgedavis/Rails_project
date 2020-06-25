class ApplicationController < ActionController::Base
    include ApplicationHelper
    # before_action :redirect_if_not_logged_in 
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    private 

 def logged_in?
   !!session[:user_id]
 end

 def current_user
   session[:user_id]
 end
end