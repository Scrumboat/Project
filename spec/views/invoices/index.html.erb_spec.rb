require 'spec_helper'

describe "invoices/index" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :nimi => "Nimi",
        :jno => 1,
        :toimihlokerroin => "Toimihlokerroin",
        :talkookerroin => 2,
        :viitesuoritukset => "9.99",
        :suorituksetIlmanViitetta => "9.99",
        :suorituksetKassaan => "9.99",
        :annetutHyvitykset => "9.99",
        :maksetunSummanPalautus => "9.99",
        :liittymismaksu => "9.99",
        :jasenmaksu => "9.99",
        :edellisenKaudenLaskutus => "9.99",
        :venerekisterimaksu => "9.99",
        :varastokoppimaksu => "9.99",
        :laiturimaksu => "9.99",
        :ensirekisterimaksu => "9.99",
        :telakkamaksu => "9.99",
        :muutMaksut => "9.99",
        :talkoosakko => "9.99",
        :katsastussakko => "9.99",
        :vartiosakko => "9.99",
        :laskutuslisa => "9.99"
      ),
      stub_model(Invoice,
        :nimi => "Nimi",
        :jno => 1,
        :toimihlokerroin => "Toimihlokerroin",
        :talkookerroin => 2,
        :viitesuoritukset => "9.99",
        :suorituksetIlmanViitetta => "9.99",
        :suorituksetKassaan => "9.99",
        :annetutHyvitykset => "9.99",
        :maksetunSummanPalautus => "9.99",
        :liittymismaksu => "9.99",
        :jasenmaksu => "9.99",
        :edellisenKaudenLaskutus => "9.99",
        :venerekisterimaksu => "9.99",
        :varastokoppimaksu => "9.99",
        :laiturimaksu => "9.99",
        :ensirekisterimaksu => "9.99",
        :telakkamaksu => "9.99",
        :muutMaksut => "9.99",
        :talkoosakko => "9.99",
        :katsastussakko => "9.99",
        :vartiosakko => "9.99",
        :laskutuslisa => "9.99"
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nimi".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Toimihlokerroin".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
