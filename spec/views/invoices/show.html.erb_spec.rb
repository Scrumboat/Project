require 'spec_helper'

describe "invoices/show" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/nimi/)
    rendered.should match(/1/)
    rendered.should match(/toimihlokerroin/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
