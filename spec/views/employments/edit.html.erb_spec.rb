require 'spec_helper'

describe "employments/edit" do
  before(:each) do
    @employment = assign(:employment, stub_model(Employment,
      :nimi => "MyString",
      :hyvityksenSuuruus => 1
    ))
  end

  it "renders the edit employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employment_path(@employment), "post" do
      assert_select "input#employment_nimi[name=?]", "employment[nimi]"
      assert_select "input#employment_hyvityksenSuuruus[name=?]", "employment[hyvityksenSuuruus]"
    end
  end
end
