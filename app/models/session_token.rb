# == Schema Information
# Schema version: 20100316044213
#
# Table name: session_tokens
#
#  id         :integer         not null, primary key
#  token      :string(255)
#  user_id    :integer
#  expiration :datetime
#  created_at :datetime
#  updated_at :datetime
#

class SessionToken < ActiveRecord::Base
end
