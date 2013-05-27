require 'spec_helper'

describe "ownerships/index" do
  before(:each) do
    assign(:ownerships, [
      stub_model(Ownership),
      stub_model(Ownership)
    ])
  end

  it "renders a list of ownerships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
