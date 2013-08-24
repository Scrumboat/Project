require 'spec_helper'

describe "employments/show" do
  before(:each) do
    @employment = assign(:employment, stub_model(Employment,
      :nimi => "Nimi",
      :hyvityksenSuuruus => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nimi/)
    rendered.should match(/1/)
  end
end
