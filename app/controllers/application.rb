# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '0a5b3f0ff2810ed7f90a0b2b6fc73c37'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
protected

  def authorize
    unless User.find_by_id( session[:user_id] )
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please login"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
  
end
