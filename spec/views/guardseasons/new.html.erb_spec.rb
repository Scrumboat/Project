require 'spec_helper'

describe "guardseasons/new" do
  before(:each) do
    assign(:guardseason, stub_model(Guardseason,
      :nimi => "MyString",
      :guardturn_id => 1
    ).as_new_record)
  end

  it "renders new guardseason form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guardseasons_path, "post" do
      assert_select "input#guardseason_nimi[name=?]", "guardseason[nimi]"
      assert_select "input#guardseason_guardturn_id[name=?]", "guardseason[guardturn_id]"
    end
  end
end
