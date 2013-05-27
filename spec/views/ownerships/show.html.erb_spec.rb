require 'spec_helper'

describe "ownerships/show" do
  before(:each) do
    @ownership = assign(:ownership, stub_model(Ownership))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
