require 'spec_helper'

describe "dockyards/new" do
  before(:each) do
    assign(:dockyard, stub_model(Dockyard,
      :name => "MyString",
      :length => "",
      :width => ""
    ).as_new_record)
  end

  it "renders new dockyard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dockyards_path, "post" do
      assert_select "input#dockyard_name[name=?]", "dockyard[name]"
      assert_select "input#dockyard_length[name=?]", "dockyard[length]"
      assert_select "input#dockyard_width[name=?]", "dockyard[width]"
    end
  end
end
