require 'test_helper'

class FoodsControllerTest < ActionController::TestCase

  def test_the_truth
      assert true
  end
  
  # Can't GET without being a signed in user with a session token
  def test_must_be_signed_in_to_get_index
      get :index
      assert_redirected_to( :controller => :home, :action => :index )
  end



end
