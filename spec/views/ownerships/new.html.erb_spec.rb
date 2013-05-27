require 'spec_helper'

describe "ownerships/new" do
  before(:each) do
    assign(:ownership, stub_model(Ownership).as_new_record)
  end

  it "renders new ownership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ownerships_path, "post" do
    end
  end
end
