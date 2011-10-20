require 'factory_girl'

Factory.define :user do |u|
  u.username 'User1'
  u.email 'user@test.com'
  u.fname 'us'
  u.lname 'er1'
  u.password 'secrete'
end