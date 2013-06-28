require 'spec_helper'

describe "pricings/index" do
  before(:each) do
    assign(:pricings, [
      stub_model(Pricing,
        :target => "Target",
        :data => 1.5
      ),
      stub_model(Pricing,
        :target => "Target",
        :data => 1.5
      )
    ])
  end

  it "renders a list of pricings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
