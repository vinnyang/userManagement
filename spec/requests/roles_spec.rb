require 'spec_helper'

describe "Roles" do
  it "should have a title" do
    Role.new(title:"").should_not be_valid
  end
end
