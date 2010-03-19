# == Schema Information
# Schema version: 20100316044213
#
# Table name: units
#
#  id         :integer         not null, primary key
#  unit_name  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Unit < ActiveRecord::Base

    # Ownership Associations
    has_many      :ingredients
    has_many      :foods

end
