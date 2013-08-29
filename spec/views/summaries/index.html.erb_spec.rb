require 'spec_helper'

describe "summaries/index" do
  before(:each) do
    assign(:summaries, [
      stub_model(Summary),
      stub_model(Summary)
    ])
  end

  it "renders a list of summaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
