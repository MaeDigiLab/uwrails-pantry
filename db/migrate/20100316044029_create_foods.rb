class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|

      t.string        :food_name
      t.integer       :serving_size         # 3
      t.integer       :serving_in_grams     # 87 [grams].  Good for conversions
      
      # Foreign Keys
      t.integer       :unit_id              # Tablespoons
      t.integer       :user_id              # Who entered this food ?

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
