require 'spec_helper'

describe "summaries/show" do
  before(:each) do
    @summary = assign(:summary, stub_model(Summary))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
