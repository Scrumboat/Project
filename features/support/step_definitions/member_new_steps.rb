#encoding: utf-8
Given(/^I add new member:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |member|
    fill_in 'member[jno]', :with => member[:Jäsennumero]
    fill_in 'member[nimi]', :with => member[:Nimi]
    fill_in 'member[sotu]', :with => member[:Sotu]
    fill_in 'member[osoite]', :with => member[:Osoite]
    fill_in 'member[posti]', :with => member[:Posti]
    fill_in 'member[matka_puh]', :with => member[:Matkapuh]
    select member[:Jäsentyyppi], :from => 'member[jasentyyppi]'
    select '1', :from => 'member[liittynyt(3i)]'
    select 'January', :from => 'member[liittynyt(2i)]'
    select '2011', :from => 'member[liittynyt(1i)]'
  end
  click_button 'Luo jäsen'
end
