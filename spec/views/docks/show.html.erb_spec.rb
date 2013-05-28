require 'spec_helper'

describe "docks/show" do
  before(:each) do
    @dock = assign(:dock, stub_model(Dock,
      :length => 1.5,
      :width => 1.5,
      :depth => 1.5,
      :exists => false,
      :number => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
