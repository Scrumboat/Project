require 'spec_helper'

describe "dockyards/show" do
  before(:each) do
    @dockyard = assign(:dockyard, stub_model(Dockyard,
      :name => "Name",
      :length => "",
      :width => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
