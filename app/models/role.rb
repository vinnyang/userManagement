class Role < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: roles
  #
  #  id         :integer         not null, primary key
  #  created_at :datetime
  #  updated_at :datetime
  #  title      :string(255)
  #
  has_and_belongs_to_many :users

  validates :title, :presence => true
end



