class FoodsController < ApplicationController

before_filter :requires_active_session_token

  def index

    st = SessionToken.find_by_token( session[:token] )
    @user = User.find( st.user_id )
    @food_counts = Food.new.count_foods()

        if params[:first].nil?
           @list = Food.find_all_by_user_id( st.user_id, :order => 'food_name ASC' )
        else
           @list = Food.all( :conditions => "food_name LIKE '#{params[:first]}%'", :order => 'food_name ASC' )
           @scoped = true
        end

  end

  def new
  end

  def create

      st = SessionToken.find_by_token( session[:token] )
      @user = User.find( st.user_id )

      @food = Food.create(
                  :food_name => params[:food][:food_name], \
                  :serving_size => params[:food][:serving_size], \
                  :serving_in_grams => params[:food][:serving_in_grams], \
                  :unit_id => params[:food][:unit_id], \
                  :user_id => st.user_id )

      if @food.valid?
         redirect_to( :controller => :foods, :action => :index )
      else
         render :new
      end

  end

end
