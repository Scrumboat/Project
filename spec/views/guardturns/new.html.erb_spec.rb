require 'spec_helper'

describe "guardturns/new" do
  before(:each) do
    assign(:guardturn, stub_model(Guardturn,
      :jno => 1
    ).as_new_record)
  end

  it "renders new guardturn form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guardturns_path, "post" do
      assert_select "input#guardturn_jno[name=?]", "guardturn[jno]"
    end
  end
end
