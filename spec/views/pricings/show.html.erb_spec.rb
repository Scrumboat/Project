require 'spec_helper'

describe "pricings/show" do
  before(:each) do
    @pricing = assign(:pricing, stub_model(Pricing,
      :target => "Target",
      :data => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target/)
    rendered.should match(/1.5/)
  end
end
