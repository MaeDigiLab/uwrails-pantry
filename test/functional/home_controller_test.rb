require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  ##############################################################################
  #
  # The home_controller is pretty simple, it allows you to view it  That's it.
  #
  ##############################################################################

  # The basic truth test
  def test_for_truth
      assert true
  end


  # You can access the /index action via GET
  def test_can_get_index_action
      get :index
      assert_response :success 
  end

end
