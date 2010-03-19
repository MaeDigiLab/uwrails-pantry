require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

    # Validations: Presence of :recipe_name
    def test_presence_of_recipe_name_validation
        r = Recipe.new
        
        assert !r.valid?
        
        assert r.errors.invalid?(:recipe_name)
    end

    def test_name_must_be_at_least_3_letters_long
        r = Recipe.new( :recipe_name => 'ba' )

        assert !r.save

        assert_equal "is too short (minimum is 3 characters)", r.errors.on(:recipe_name)
    end


end
