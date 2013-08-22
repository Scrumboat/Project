require 'spec_helper'

describe "guardturns/show" do
  before(:each) do
    @guardturn = assign(:guardturn, stub_model(Guardturn,
      :jno => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
