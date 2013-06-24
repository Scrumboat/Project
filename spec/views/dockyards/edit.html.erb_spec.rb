require 'spec_helper'

describe "dockyards/edit" do
  before(:each) do
    @dockyard = assign(:dockyard, stub_model(Dockyard,
      :name => "MyString",
      :length => "",
      :width => ""
    ))
  end

  it "renders the edit dockyard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dockyard_path(@dockyard), "post" do
      assert_select "input#dockyard_name[name=?]", "dockyard[name]"
      assert_select "input#dockyard_length[name=?]", "dockyard[length]"
      assert_select "input#dockyard_width[name=?]", "dockyard[width]"
    end
  end
end
