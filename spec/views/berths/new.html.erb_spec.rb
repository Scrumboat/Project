require 'spec_helper'

describe "berths/new" do
  before(:each) do
    assign(:berth, stub_model(Berth).as_new_record)
  end

  it "renders new berth form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", berths_path, "post" do
    end
  end
end
