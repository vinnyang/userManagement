require 'factory_girl'

Factory.define :user do |u|
  u.username 'vic123'
  u.email 'vince@test.com'
  u.fname 'vince'
  u.lname 'yung'
  u.password 'secrete'
  u.password_confirmation 'secrete'
end