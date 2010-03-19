class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|

      t.string            :recipe_name
      t.string            :chef
      t.string            :source
      
      # Foreign keys
      t.integer           :user_id        # Who created this recipe ?

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
