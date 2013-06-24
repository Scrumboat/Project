require 'spec_helper'

describe "dockyards/index" do
  before(:each) do
    assign(:dockyards, [
      stub_model(Dockyard,
        :name => "Name",
        :length => "",
        :width => ""
      ),
      stub_model(Dockyard,
        :name => "Name",
        :length => "",
        :width => ""
      )
    ])
  end

  it "renders a list of dockyards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
