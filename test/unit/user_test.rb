require 'test_helper'

class UserTest < ActiveSupport::TestCase

fixtures :users


    # Test Truth
    def test_the_truth
      assert true
    end
    
    
    # Validations: Presence of :email, :pw, :screen_name
    def test_presence_of_email_pw_screen_name_validation
        u = User.new
        
        assert !u.valid?
        
        assert u.errors.invalid?(:email)
        assert u.errors.invalid?(:pw)
        assert u.errors.invalid?(:screen_name)
        
    end

    
    # Validations: Uniqueness of Screen Name
    def test_screen_name_uniqueness_validation
        u = User.new( :screen_name => users(:john_smith).screen_name, \
                      :email => 'foo@bar', \
                      :pw => 'abc' )
                      
        assert !u.save
        
        assert_equal "has already been taken", u.errors.on(:screen_name)
    end


    # Validations: Uniqueness of Email Address
    def test_screen_name_uniqueness_validation
        u = User.new( :screen_name => 'janey', \
                      :email => users(:jane_doe).email, \
                      :pw => 'abc' )
                      
        assert !u.save
        
        assert_equal "has already been taken", u.errors.on(:email)
    end


end
