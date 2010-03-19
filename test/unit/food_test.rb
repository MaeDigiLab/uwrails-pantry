require 'test_helper'

class FoodTest < ActiveSupport::TestCase

    # Test Truth
    def test_the_truth
      assert true
    end
    
    
    # Validations: Presence of :email, :pw, :screen_name
    def test_presence_of_food_name_serving_size_serving_in_grams_validation
        f = Food.new
        
        assert !f.valid?
        
        assert f.errors.invalid?(:food_name)
        assert f.errors.invalid?(:serving_size)
        assert f.errors.invalid?(:serving_in_grams)
        
    end

    
    # Validations: Uniqueness of Screen Name
    def test_screen_name_uniqueness_validation
        f = Food.new( :food_name => foods(:apple).food_name, \
                      :serving_size => 10, \
                      :serving_in_grams => 100 )
                      
        assert !f.save
        
        assert_equal "has already been taken", f.errors.on(:food_name)
    end


    def test_serving_data_must_be_numerical
        f = Food.new( :food_name => 'pear', \
                      :serving_size => 'a', \
                      :serving_in_grams => 'b' )
                      
        assert !f.save
                      
        assert_equal "is not a number", f.errors.on(:serving_size)
        assert_equal "is not a number", f.errors.on(:serving_in_grams)              
    end


    def test_name_must_be_at_least_3_letters_long
        f = Food.new( :food_name => 'pi', \
                      :serving_size => 3, \
                      :serving_in_grams => 14 )

        assert !f.save

        assert_equal "is too short (minimum is 3 characters)", f.errors.on(:food_name)
    end
        
end
