# == Schema Information
# Schema version: 20100316044213
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  screen_name         :string(255)
#  email               :string(255)
#  pw                  :string(255)
#  login_count         :integer         default(0)
#  login_failure_count :integer         default(0)
#  last_login_ip       :string(255)     default("")
#  last_login_at       :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base

    # Validations
    validates_presence_of       :screen_name
    validates_presence_of       :pw
    validates_presence_of       :email
    validates_uniqueness_of     :email
    validates_uniqueness_of     :screen_name

    # Ownership Associations
    has_many          :recipes
    has_many          :units
    has_many          :foods
    #has_many          :nutrients
    #has_many          :nutritional_data

end
