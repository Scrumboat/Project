require 'spec_helper'

describe "storages/show" do
  before(:each) do
    @storage = assign(:storage, stub_model(Storage,
      :vk => "Vk",
      :pala => "9.99",
      :jno => 1,
      :koppimk => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vk/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
