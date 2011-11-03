require 'factory_girl'

Factory.define :user do |u|
  u.username 'newuser'
  u.email 'new@user.com'
  u.fname 'new'
  u.lname 'user' 
  u.password 'newuserpw'
  u.password_confirmation 'newuserpw'
end