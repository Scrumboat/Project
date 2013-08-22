require 'spec_helper'

describe "guardturns/edit" do
  before(:each) do
    @guardturn = assign(:guardturn, stub_model(Guardturn,
      :jno => 1
    ))
  end

  it "renders the edit guardturn form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guardturn_path(@guardturn), "post" do
      assert_select "input#guardturn_jno[name=?]", "guardturn[jno]"
    end
  end
end
