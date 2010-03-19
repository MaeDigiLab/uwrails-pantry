class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

      t.string            :screen_name
      t.string            :email
      t.string            :pw
      t.integer           :login_count,         :default => 0
      t.integer           :login_failure_count, :default => 0
      t.string            :last_login_ip,       :default => ''
      t.datetime          :last_login_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
