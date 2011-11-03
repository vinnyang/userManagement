require 'spec_helper'

describe SessionsController do
  render_views
  before(:each) do 
     @user = { username:'newuser',
               email:'new@user.com',
               fname:'new',
               lname:'user',
               password:'userpw',
               password_confirmation:'userpw'}
         
     @createdUser = User.create!(@user)
   end
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      @attr ={:session=>{ :email=> @createdUser.email, :password=> @createdUser.password} }
      post 'create', @attr
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "signin failure" do

        before(:each) do
          @signin = { :email => "email@fail.com", :password => "invalid" }
        end

        it "should re-render the new page" do
          post :create, :session => @signin
          response.should render_template('new')
        end

        it "should have a flash.now message" do
          post :create, :session => @signin
          flash.now[:error].should =~ /invalid/i
        end
  end

  describe "valid signin" do
      before(:each) do 
        @attr = { :email => @createdUser.email, :password => @createdUser.password }
      end
    it "should sign the user in" do 
        post :create, :session => @attr # fill in with tests for a signed-in user.
    end
    it "should redirect to the user show page" do 
      post :create, :session => @attr 
      response.should redirect_to(user_path(@createdUser))
    end
  end
end
