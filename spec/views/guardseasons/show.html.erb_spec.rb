require 'spec_helper'

describe "guardseasons/show" do
  before(:each) do
    @guardseason = assign(:guardseason, stub_model(Guardseason,
      :nimi => "Nimi",
      :guardturn_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nimi/)
    rendered.should match(/1/)
  end
end
