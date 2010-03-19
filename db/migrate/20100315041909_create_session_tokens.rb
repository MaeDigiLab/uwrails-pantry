class CreateSessionTokens < ActiveRecord::Migration
  def self.up
    create_table :session_tokens do |t|

      t.string          :token
      t.integer         :user_id
      t.datetime        :expiration


      t.timestamps
    end
  end

  def self.down
    drop_table :session_tokens
  end
end
