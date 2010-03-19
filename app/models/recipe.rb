# == Schema Information
# Schema version: 20100316044213
#
# Table name: recipes
#
#  id          :integer         not null, primary key
#  recipe_name :string(255)
#  chef        :string(255)
#  source      :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Recipe < ActiveRecord::Base

    # Validations 
    validates_presence_of       :recipe_name
    validates_length_of         :recipe_name, :minimum => 3


    # Ownership Associations
    belongs_to      :user
    has_many        :ingredients
    has_many        :foods,   :through => :ingredients



    ##
    # CONVENIENCE METHODS
    
    def count_recipes()
        @counts = Hash.new
          ('A'..'Z').each { |element|
            num = Recipe.count( :conditions => "recipe_name LIKE '#{element}%'")
            @counts.store( element, num )
          }
            return @counts
    end
    
    def name
        recipe_name
    end

end
