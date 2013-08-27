require 'spec_helper'

describe "summaries/edit" do
  before(:each) do
    @summary = assign(:summary, stub_model(Summary))
  end

  it "renders the edit summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", summary_path(@summary), "post" do
    end
  end
end
