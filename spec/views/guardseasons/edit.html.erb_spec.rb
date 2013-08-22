require 'spec_helper'

describe "guardseasons/edit" do
  before(:each) do
    @guardseason = assign(:guardseason, stub_model(Guardseason,
      :nimi => "MyString",
      :guardturn_id => 1
    ))
  end

  it "renders the edit guardseason form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guardseason_path(@guardseason), "post" do
      assert_select "input#guardseason_nimi[name=?]", "guardseason[nimi]"
      assert_select "input#guardseason_guardturn_id[name=?]", "guardseason[guardturn_id]"
    end
  end
end
