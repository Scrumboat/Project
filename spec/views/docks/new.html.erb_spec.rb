require 'spec_helper'

describe "docks/new" do
  before(:each) do
    assign(:dock, stub_model(Dock,
      :length => 1.5,
      :width => 1.5,
      :depth => 1.5,
      :exists => false,
      :number => 1
    ).as_new_record)
  end

  it "renders new dock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", docks_path, "post" do
      assert_select "input#dock_length[name=?]", "dock[length]"
      assert_select "input#dock_width[name=?]", "dock[width]"
      assert_select "input#dock_depth[name=?]", "dock[depth]"
      assert_select "input#dock_exists[name=?]", "dock[exists]"
      assert_select "input#dock_number[name=?]", "dock[number]"
    end
  end
end
