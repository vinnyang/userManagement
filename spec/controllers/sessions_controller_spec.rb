require 'spec_helper'

describe SessionsController do
  render_views
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "signin failure" do

        before(:each) do
          @signin = { :email => "email@failure.com", :password => "invalid" }
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
        @user = Factory(:user) 
        @attr = { :email => @user.email, :password => @user.password }
      end
    it "should sign the user in" do 
        post :create, :session => @attr # fill in with tests for a signed-in user.
    end
    it "should redirect to the user show page" do 
      post :create, :session => @attr 
      response.should redirect_to(user_path(@user))
    end
  end
end
