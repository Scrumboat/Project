require 'spec_helper'

describe "pricings/edit" do
  before(:each) do
    @pricing = assign(:pricing, stub_model(Pricing,
      :target => "MyString",
      :data => 1.5
    ))
  end

  it "renders the edit pricing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pricing_path(@pricing), "post" do
      assert_select "input#pricing_target[name=?]", "pricing[target]"
      assert_select "input#pricing_data[name=?]", "pricing[data]"
    end
  end
end
