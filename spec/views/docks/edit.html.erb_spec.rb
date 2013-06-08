require 'spec_helper'

describe "docks/edit" do
  before(:each) do
    @dock = assign(:dock, stub_model(Dock,
      :length => "9.99"
    ))
  end

  it "renders the edit dock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dock_path(@dock), "post" do
      assert_select "input#dock_length[name=?]", "dock[length]"
    end
  end
end
