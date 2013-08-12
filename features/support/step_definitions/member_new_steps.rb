#encoding: utf-8
Given(/^I add new member:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |member|
    fill_in 'member[Jno]', :with => member[:Jäsennumero]
    fill_in 'member[Nimi]', :with => member[:Nimi]
    fill_in 'member[Sotu]', :with => member[:Sotu]
    fill_in 'member[Osoite]', :with => member[:Osoite]
    fill_in 'member[Posti]', :with => member[:Posti]
    fill_in 'member[MatkaPuh]', :with => member[:Matkapuh]
    select member[:Jäsentyyppi], :from => 'member[jasentyyppi]'
    select '1', :from => 'member[Liittynyt(3i)]'
    select 'January', :from => 'member[Liittynyt(2i)]'
    select '2011', :from => 'member[Liittynyt(1i)]'
  end
  click_button 'Luo jäsen'
end
