Given(/^I add new dock:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |dock|
  	fill_in 'dock[length]', :with => dock['length']
  end
  click_button 'lisaa_laituri'
end