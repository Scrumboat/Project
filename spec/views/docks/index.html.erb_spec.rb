require 'spec_helper'

describe "docks/index" do
  before(:each) do
    assign(:docks, [
      stub_model(Dock,
        :length => 1.5,
        :width => 1.5,
        :depth => 1.5,
        :exists => false,
        :number => 1
      ),
      stub_model(Dock,
        :length => 1.5,
        :width => 1.5,
        :depth => 1.5,
        :exists => false,
        :number => 1
      )
    ])
  end

  it "renders a list of docks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
