require 'spec_helper'

describe "berths/edit" do
  before(:each) do
    @berth = assign(:berth, stub_model(Berth))
  end

  it "renders the edit berth form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", berth_path(@berth), "post" do
    end
  end
end
