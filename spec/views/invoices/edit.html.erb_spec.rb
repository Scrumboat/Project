require 'spec_helper'

describe "invoices/edit" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :nimi => "MyString",
      :jno => 1,
      :toimihlokerroin => "MyString",
      :talkookerroin => 1,
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
    ))
  end

  it "renders the edit invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do
      assert_select "input#invoice_nimi[name=?]", "invoice[nimi]"
      assert_select "input#invoice_jno[name=?]", "invoice[jno]"
      assert_select "input#invoice_toimihlokerroin[name=?]", "invoice[toimihlokerroin]"
      assert_select "input#invoice_talkookerroin[name=?]", "invoice[talkookerroin]"
      assert_select "input#invoice_viitesuoritukset[name=?]", "invoice[viitesuoritukset]"
      assert_select "input#invoice_suoritukset_ilman_viitetta[name=?]", "invoice[suoritukset_ilman_viitetta]"
      assert_select "input#invoice_suoritukset_kassaan[name=?]", "invoice[suoritukset_kassaan]"
      assert_select "input#invoice_annetut_hyvitykset[name=?]", "invoice[annetut_hyvitykset]"
      assert_select "input#invoice_maksetun_summan_palautus[name=?]", "invoice[maksetun_summan_palautus]"
      assert_select "input#invoice_liittymismaksu[name=?]", "invoice[liittymismaksu]"
      assert_select "input#invoice_jasenmaksu[name=?]", "invoice[jasenmaksu]"
      assert_select "input#invoice_edellis_kauden_laskutus[name=?]", "invoice[edellis_kauden_laskutus]"
      assert_select "input#invoice_venerekisterimaksu[name=?]", "invoice[venerekisterimaksu]"
      assert_select "input#invoice_varastokoppimaksu[name=?]", "invoice[varastokoppimaksu]"
      assert_select "input#invoice_laiturimaksu[name=?]", "invoice[laiturimaksu]"
      assert_select "input#invoice_ensirekisterimaksu[name=?]", "invoice[ensirekisterimaksu]"
      assert_select "input#invoice_telakkamaksu[name=?]", "invoice[telakkamaksu]"
      assert_select "input#invoice_muutMaksut[name=?]", "invoice[muutMaksut]"
      assert_select "input#invoice_talkoosakko[name=?]", "invoice[talkoosakko]"
      assert_select "input#invoice_katsastussakko[name=?]", "invoice[katsastussakko]"
      assert_select "input#invoice_vartiosakko[name=?]", "invoice[vartiosakko]"
      assert_select "input#invoice_laskutuslisa[name=?]", "invoice[laskutuslisa]"
    end
  end
end
