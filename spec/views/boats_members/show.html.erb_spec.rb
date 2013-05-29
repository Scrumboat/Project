require 'spec_helper'

describe "boats_members/show" do
  before(:each) do
    @boats_member = assign(:boats_member, stub_model(BoatsMember,
      :boat_id => 1,
      :member_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
