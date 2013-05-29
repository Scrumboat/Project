require 'spec_helper'

describe "boats_members/new" do
  before(:each) do
    assign(:boats_member, stub_model(BoatsMember,
      :boat_id => 1,
      :member_id => 1
    ).as_new_record)
  end

  it "renders new boats_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boats_members_path, "post" do
      assert_select "input#boats_member_boat_id[name=?]", "boats_member[boat_id]"
      assert_select "input#boats_member_member_id[name=?]", "boats_member[member_id]"
    end
  end
end
