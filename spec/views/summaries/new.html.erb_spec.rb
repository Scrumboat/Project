require 'spec_helper'

describe "summaries/new" do
  before(:each) do
    assign(:summary, stub_model(Summary).as_new_record)
  end

  it "renders new summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", summaries_path, "post" do
    end
  end
end
