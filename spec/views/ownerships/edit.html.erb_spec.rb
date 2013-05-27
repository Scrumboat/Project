require 'spec_helper'

describe "ownerships/edit" do
  before(:each) do
    @ownership = assign(:ownership, stub_model(Ownership))
  end

  it "renders the edit ownership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ownership_path(@ownership), "post" do
    end
  end
end
