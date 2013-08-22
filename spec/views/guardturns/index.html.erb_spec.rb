require 'spec_helper'

describe "guardturns/index" do
  before(:each) do
    assign(:guardturns, [
      stub_model(Guardturn,
        :jno => 1
      ),
      stub_model(Guardturn,
        :jno => 1
      )
    ])
  end

  it "renders a list of guardturns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
