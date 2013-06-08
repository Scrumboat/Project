require 'spec_helper'

describe "docks/show" do
  before(:each) do
    @dock = assign(:dock, stub_model(Dock,
      :length => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
