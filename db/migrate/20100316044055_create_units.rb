class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|

      t.string          :unit_name
      
      # Foreign Keys
      t.integer         :user_id        # Who entered this unit ?

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
