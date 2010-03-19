class LoginController < ApplicationController

  require 'digest/sha2'


  def create
    # Extract the submitted parameters    
      @email = params[:user][:email].downcase
      @pw = params[:user][:pw]
      
      # Check the database to see if this user exists
      @user = User.find_by_email( @email )
         
         ###
         # User not found in the database
         if @user.nil? 
              # Set the error flash
              flash[:error] = "Email account not recognized."
  
              # Return to the Home Controller
              redirect_to( :controller => :home, :action => :index )
         
  
         ###
         # User found, but password doesn't match
        elsif @user.pw != @pw 
              # Set the error flash
              flash[:error] = "Password incorrect for this email account."
              # Update the found user with this failed login
              @user.increment( :login_failure_count )
              @user.save
              # Return to the Home Controller
              redirect_to( :controller => :home, :action => :index )
  
         ###
         # User found, passwords match 
         else 
              # Update the values in the found user class
              @user.increment( :login_count )
              @user.last_login_ip = request.remote_ip
              @user.last_login_at = Time.now
              # Save the updated data back to the database
              @user.save
              
              # Prepare an entry for the SessionToken table
              st = SessionToken.new
              
              token = Digest::SHA256.hexdigest( @user.id.to_s + Time.now.to_s )
              session[:token] = token
              st.token = token
              st.user_id = @user.id
              st.expiration = 2.hours.from_now
              st.save
  
              # Forward the logged-in user to the recipes screen
              redirect_to( :controller => :recipes, :action => :index )
         end
  end
   

  def destroy
      # Destroy the SessionToken entry, and set the session ID to Nil
      st = SessionToken.find_by_token( session[:token] )
      session[:token] = nil
      st.delete

     # Set the error flash
     flash[:message] = "You have been logged out."


      redirect_to( :controller => :home, :action => :index )
  end   

end