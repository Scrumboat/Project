require 'spec_helper'

describe "boats_members/index" do
  before(:each) do
    assign(:boats_members, [
      stub_model(BoatsMember,
        :boat_id => 1,
        :member_id => 2
      ),
      stub_model(BoatsMember,
        :boat_id => 1,
        :member_id => 2
      )
    ])
  end

  it "renders a list of boats_members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
