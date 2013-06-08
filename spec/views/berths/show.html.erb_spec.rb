require 'spec_helper'

describe "berths/show" do
  before(:each) do
    @berth = assign(:berth, stub_model(Berth))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
