require 'spec_helper'

describe "docks/index" do
  before(:each) do
    assign(:docks, [
      stub_model(Dock,
        :length => "9.99"
      ),
      stub_model(Dock,
        :length => "9.99"
      )
    ])
  end

  it "renders a list of docks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
