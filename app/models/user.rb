class User < ActiveRecord::Base
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  email      :string(255)
#  fname      :string(255)
#  lname      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  Password   :string(255)
#
  has_and_belongs_to_many :roles
  attr_accessible :username, :email, :fname, :lname
  
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..30}



end