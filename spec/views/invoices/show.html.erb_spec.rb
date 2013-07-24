require 'spec_helper'

describe "invoices/show" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nimi/)
    rendered.should match(/1/)
    rendered.should match(/Toimihlokerroin/)
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
