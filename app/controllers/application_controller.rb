# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :pw
  
  protected
  
  def requires_active_session_token

    # Does the token even exist?
    if session[:token].nil?
        flash[:error] = "You need to log-in to access that page."
        redirect_to root_url
       
    # The token exists, is there a session entry for it?
    else
       
        st = SessionToken.find_by_token( session[:token] )
       
        # Was there a session token row found?
        if st.nil?
           session[:token] = nil
           flash[:error] = "Invalid Session Token. Please log-in."
           redirect_to root_url

        elsif Time.now > st.expiration
           st.delete
           flash[:error] = "Your session has expired. Please log-in again."
           redirect_to root_url

        end
       
     end
  end

=begin
  def already_logged_in  
  
      if session[:token]
        st = SessionToken.find_by_token( session[:token] )
       
        # Was there a session token row found?
        if st.nil?
           session[:token] = nil

        # Is the sesssion expiration time past the current time?
        elsif Time.now > st.expiration_time
           st.delete
           flash[:error] = "Your session has expired. Please log-in again."

        # Session is valid, so don't allow them to login twice
        else
           redirect_to recipes_url        
        end
  
  end
=end
  
end
