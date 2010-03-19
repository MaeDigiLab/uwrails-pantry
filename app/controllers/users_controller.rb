class UsersController < ApplicationController

  def new
      @user = User.new
  end

  def index
      redirect_to( :controller => :users, :action => :new )
  end

  def create
  
          @user = User.create( 
                  :screen_name => params[:user][:screen_name], \
                  :email => params[:user][:email], \
                  :pw => params[:user][:pw] )
                  

          if @user.valid?
              redirect_to( :controller => :home, :action => :index )
          else
              render :new
          end
  
  end

end