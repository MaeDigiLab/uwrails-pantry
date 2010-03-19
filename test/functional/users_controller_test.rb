require 'test_helper'

class UsersControllerTest < ActionController::TestCase

################################################################################
#
# The users controller does not have an :index, it only has :new and a :create
# actions.  New responds to GET, but create only responds to POST.
#
################################################################################

  # Things are true
  def test_things_are_true
      assert true
  end
  
  
  # If you GET :index, you are redirected to :new
  def test_index_redirects_to_new

      get :index
      assert_redirected_to( :controller => :users, :action=> :new )

  end

  # You can GET :new
  def test_can_get_new
      get :new
      assert_response :success
  end


  # You can POST :create, but if there's no data, you redirect to :new
#  def test_post_no_data_to_create_redirects_to_new
#      post :create, :user => { :screen_name => '', :email => '', :pw => '' }
#      assert_redirected_to( :controller => :users, :action => :new )
#  end


  # If you post good data to :create, it creates a new User record
  def test_post_good_data_to_create

      assert_difference( 'User.count' ) do
        post :create, :user => { :screen_name => 'JohnnyBravo', :email => 'johnny@bravo.com', :pw => 'foo' }
      end

      assert_redirected_to( :controller => :home, :action => :index )
      
  end  
  
end