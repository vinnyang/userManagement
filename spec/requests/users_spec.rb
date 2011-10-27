require 'spec_helper'

describe "User" do
  
   before(:each) do 
      @user = { username:'adminuser',
                email:'admin@user.com',
                fname:'admin',
                lname:'user',
                password:'adminpw',
                password_confirmation:'adminpw'}
    end
  
   describe "attributes" do
        it "should accept @user" do
          valid_user = User.create!(@user).
            should be_valid
        end
  
        it "should reject duplicated user" do
          User.create!(@user)
          exsiting_user = User.new(@user).
            should_not be_valid
        end
   end
   
   describe "username" do
        it "should require an username" do
          no_username = User.new(@user.merge(:username => "")).
            should_not be_valid
        end
  
        it "should reject username that is too short or too long" do
          short = "a"*2
          long = "a"*17
          invalid_length_username = User.new(@user.merge(:username => short)).
            should_not be_valid
          invalid_length_username = User.new(@user.merge(:username => long)).
            should_not be_valid
        end
   end
 
   describe "email" do
        it "should have a valid email" do
            invalid_emails = %w[user@test,com user_at_test.org user.@test.]
            invalid_emails.each do |ie|
              invalid_email_user = User.new(@user.merge(:email => ie)).
                should_not be_valid
            end
        end
        
        it "should not take duplicated email" do
          User.create!(@user)
          User.new.(@user.merge(:email => @user[:email].upcase)).
            should_not be_valid
        end
   end
  
   describe "password" do
           it "should require a password" do
             User.new(@user.merge(password:"", password_confirmation:"")).
               should_not be_valid
           end
   
           it "should reject unmatched password-and-password_confirmation" do
             User.new(@user.merge(password:"password", password_confirmation:"password".reverse)).
               should_not be_valid
           end
   
           it "should require a password with proper length" do
             long = "a"*51
             short = "a"*3
             User.new(@user.merge(password:long, password_confirmation:long)).
               should_not be_valid
             User.new(@user.merge(password:short, password_confirmation:short)).
               should_not be_valid
           end
   end
      
   describe "has_password" do
     it "should be true if the passwords match" do 
       @user.has_password?(@user[:password]).
        should be_true
     end
     it "should be false if the passwords don't match" do 
       @user.has_password?(@user[:password].reverse).
        should be_false
     end
   end
   
   describe "first name, last name" do
        it "should have a first name" do
            no_fname = User.new(@user.merge(:fname => "")).
              should_not be_valid
        end

        it "should have a last name" do
            no_lname = User.new(@user.merge(:lname => "")).
              should_not be_valid
        end
  
        it "should only accept fname/lname that has proper length" do
          long = "a"*31
          short = "a"
          User.new(@user.merge(fname:long)).
            should_not be_valid
          User.new(@user.merge(fname:short)).
            should_not be_valid
          User.new(@user.merge(lname:long)).
            should_not be_valid
          User.new(@user.merge(fname:short)).
            should_not be_valid
        end
   end
      
   describe "paths" do 

       it "should have a path for the 'Index' action" do
         # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
         get users_path
         response.status.should be(200)
       end

       it "should be the correct path for 'New' action" do
         get new_user_path
         response.should be_success
       end

       it "should be the correct path for 'Edit' action" # do
       #       get edit_user_path
       #       response.should be_success
       #     end

       it "should be the correct path for 'Show' action" # do
       #       get user_path
       #       response.should be_success
       #     end
    end
end
# end
