class RecipesController < ApplicationController

before_filter :requires_active_session_token


    def index
        st = SessionToken.find_by_token( session[:token] )
        @user = User.find( st.user_id )
        @recipe_counts = Recipe.new.count_recipes()

        if params[:first].nil?
           @list = Recipe.find_all_by_user_id( st.user_id, :order => 'recipe_name ASC' )
        else
           @list = Recipe.all( :conditions => "recipe_name LIKE '#{params[:first]}%'", :order => 'recipe_name ASC' )
           @scoped = true
        end
    end

    
    def new
    end
    
    def create

        st = SessionToken.find_by_token( session[:token] )
        @user = User.find( st.user_id )

    
        @recipe = Recipe.create( 
                  :recipe_name => params[:recipe][:recipe_name], \
                  :chef => params[:recipe][:chef], \
                  :source => params[:recipe][:source], \
                  :user_id => st.user_id )
                  
        if @recipe.valid?
            redirect_to( :controller => :recipes, :action => :index )
        else
            render :new
        end
    end


    def edit

        st = SessionToken.find_by_token( session[:token] )
        @user = User.find( st.user_id )

        @recipe = Recipe.find( params[:id] )
    
        @food_counts = Food.new.count_foods()
        @list = Food.all( :conditions => "food_name LIKE 'B%'", :order => 'food_name ASC' )

    end


    def show
        st = SessionToken.find_by_token( session[:token] )
        @user = User.find( st.user_id )
        
        @recipe = Recipe.find( params[:id] )
    end
        
    def add_ingredient
    
        f = Food.find( 1 )
        i = Ingredient.new
    
    end

end
