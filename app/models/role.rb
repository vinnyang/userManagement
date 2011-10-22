class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
end

# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

