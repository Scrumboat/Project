require 'spec_helper'

describe "employments/new" do
  before(:each) do
    assign(:employment, stub_model(Employment,
      :nimi => "MyString",
      :hyvityksenSuuruus => 1
    ).as_new_record)
  end

  it "renders new employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employments_path, "post" do
      assert_select "input#employment_nimi[name=?]", "employment[nimi]"
      assert_select "input#employment_hyvityksenSuuruus[name=?]", "employment[hyvityksenSuuruus]"
    end
  end
end
