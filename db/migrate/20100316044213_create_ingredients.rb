class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|

      t.integer             :quantity         # 3
      
      # Joined Records
      t.integer             :recipe_id
      t.integer             :foods_id
      
      # Foreign Keys
      t.integer             :unit_id          # Tablespoons

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
