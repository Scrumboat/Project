require 'spec_helper'

describe "berths/index" do
  before(:each) do
    assign(:berths, [
      stub_model(Berth),
      stub_model(Berth)
    ])
  end

  it "renders a list of berths" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
