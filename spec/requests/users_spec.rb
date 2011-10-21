require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "should have the correct path" do
      {:get => "users#index"}.
        response.should render_template("index")
    end
  end
end
