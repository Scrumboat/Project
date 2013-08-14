require 'spec_helper'

describe "invoices/index" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :nimi => "nimi",
        :jno => 1,
        :toimihlokerroin => "toimihlokerroin",
        :talkookerroin => 2,
        :viitesuoritukset => "9.99",
        :suoritukset_ilman_viitetta => "9.99",
        :suoritukset_kassaan => "9.99",
        :annetut_hyvitykset => "9.99",
        :maksetun_summan_palautus => "9.99",
        :liittymismaksu => "9.99",
        :jasenmaksu => "9.99",
        :edellis_kauden_laskutus => "9.99",
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
        :nimi => "nimi",
        :jno => 1,
        :toimihlokerroin => "toimihlokerroin",
        :talkookerroin => 2,
        :viitesuoritukset => "9.99",
        :suoritukset_ilman_viitetta => "9.99",
        :suoritukset_kassaan => "9.99",
        :annetut_hyvitykset => "9.99",
        :maksetun_summan_palautus => "9.99",
        :liittymismaksu => "9.99",
        :jasenmaksu => "9.99",
        :edellis_kauden_laskutus => "9.99",
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
    assert_select "tr>td", :text => "nimi".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "toimihlokerroin".to_s, :count => 2
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
