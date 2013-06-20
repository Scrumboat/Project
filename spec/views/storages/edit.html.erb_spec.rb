require 'spec_helper'

describe "storages/edit" do
  before(:each) do
    @storage = assign(:storage, stub_model(Storage,
      :vk => "MyString",
      :pala => "9.99",
      :jno => 1,
      :koppimk => 1
    ))
  end

  it "renders the edit storage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", storage_path(@storage), "post" do
      assert_select "input#storage_vk[name=?]", "storage[vk]"
      assert_select "input#storage_pala[name=?]", "storage[pala]"
      assert_select "input#storage_jno[name=?]", "storage[jno]"
      assert_select "input#storage_koppimk[name=?]", "storage[koppimk]"
    end
  end
end
