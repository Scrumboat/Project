require 'spec_helper'

describe "storages/new" do
  before(:each) do
    assign(:storage, stub_model(Storage,
      :vk => "MyString",
      :pala => "9.99",
      :jno => 1,
      :koppimk => 1
    ).as_new_record)
  end

  it "renders new storage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", storages_path, "post" do
      assert_select "input#storage_vk[name=?]", "storage[vk]"
      assert_select "input#storage_pala[name=?]", "storage[pala]"
      assert_select "input#storage_jno[name=?]", "storage[jno]"
      assert_select "input#storage_koppimk[name=?]", "storage[koppimk]"
    end
  end
end
