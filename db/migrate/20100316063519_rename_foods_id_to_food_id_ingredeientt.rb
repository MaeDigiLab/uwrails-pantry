class RenameFoodsIdToFoodIdIngredeientt < ActiveRecord::Migration
  def self.up
  end
  
  rename_column   :ingredients, :foods_id, :food_id

  def self.down

  rename_column   :ingredients, :food_id, :foods_id

  end
end
