require 'spec_helper'

describe "docks/new" do
  before(:each) do
    assign(:dock, stub_model(Dock,
      :length => "9.99"
    ).as_new_record)
  end

  it "renders new dock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", docks_path, "post" do
      assert_select "input#dock_length[name=?]", "dock[length]"
    end
  end
end
