# == Schema Information
# Schema version: 20100316044213
#
# Table name: foods
#
#  id               :integer         not null, primary key
#  food_name        :string(255)
#  serving_size     :integer
#  serving_in_grams :integer
#  unit_id          :integer
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Food < ActiveRecord::Base

    # validations
    validates_presence_of       :food_name, :serving_size, :serving_in_grams
    validates_uniqueness_of     :food_name
    validates_numericality_of   :serving_size, :serving_in_grams
    validates_length_of         :food_name, :minimum => 3



    # Ownership Associations
    belongs_to      :user
    belongs_to      :unit
    has_many        :ingredients
    #has_many        :nutritional_data
    has_many        :recipes,   :through => :ingredients
    #has_many        :nutrients, :through => :nutritional_data


    # Convenience Methods
    
    def measure
        unit.unit_name
    end

    def serving
        # This should return a plural if serving size is > 1
        if serving_size == 1
           serving_size.to_s + ' ' + unit.unit_name
        else 
           serving_size.to_s + ' ' + unit.unit_name + 's'
        end
    end

    def count_foods()
        @counts = Hash.new
          ('A'..'Z').each { |element|
            num = Food.count( :conditions => "food_name LIKE '#{element}%'")
            @counts.store( element, num )
          }
            return @counts
    end
    
    def name
        food_name
    end

end
