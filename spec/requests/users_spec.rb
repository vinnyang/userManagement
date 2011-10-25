require 'spec_helper'

describe "UserRoutes" do
  describe "GET /users" do
    it "should have a path for the 'Index' action" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      response.status.should be(200)
    end
  end
  
  describe "GET 'new'" do
    it "should be the correct path for 'New' action" do
      get new_user_path
      response.should be_success
    end
  end
  
  describe "GET 'edit'" do
    it "should be the correct path for 'Edit' action" do
      get edit_user_path
      response.should be_success
    end
  end
  describe "GET 'user'" do
    it "should be the correct path for 'Show' action" do
      get user_path
      response.should be_success
    end
  end
  
end
