require 'factory_girl'

Factory.define :user do |u|
  u.username 'admin'
  u.email 'admin@test.com'
  u.fname 'admin'
  u.lname 'admin' 
  u.password 'adminpw'
  u.password_confirmation 'adminpw'
end