# == Schema Information
# Schema version: 20100316044213
#
# Table name: ingredients
#
#  id         :integer         not null, primary key
#  quantity   :integer
#  recipe_id  :integer
#  foods_id   :integer
#  unit_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Ingredient < ActiveRecord::Base

    # Ownership Associations
    belongs_to      :unit
    belongs_to      :food
    belongs_to      :recipe

    def name
        Food.find( food_id ).name
    end

    def units
        if quantity == 1
          Unit.find( unit_id ).unit_name
        else
          Unit.find( unit_id ).unit_name + 's'
        end
    end

end
