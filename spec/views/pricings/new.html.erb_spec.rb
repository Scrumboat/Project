require 'spec_helper'

describe "pricings/new" do
  before(:each) do
    assign(:pricing, stub_model(Pricing,
      :target => "MyString",
      :data => 1.5
    ).as_new_record)
  end

  it "renders new pricing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pricings_path, "post" do
      assert_select "input#pricing_target[name=?]", "pricing[target]"
      assert_select "input#pricing_data[name=?]", "pricing[data]"
    end
  end
end
