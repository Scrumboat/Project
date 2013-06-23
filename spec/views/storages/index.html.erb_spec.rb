require 'spec_helper'

describe "storages/index" do
  before(:each) do
    assign(:storages, [
      stub_model(Storage,
        :vk => "Vk",
        :pala => "9.99",
        :jno => 1,
        :koppimk => 2
      ),
      stub_model(Storage,
        :vk => "Vk",
        :pala => "9.99",
        :jno => 1,
        :koppimk => 2
      )
    ])
  end

  it "renders a list of storages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vk".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
