Given(/^I add new berth:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |berth|
  	fill_in 'berth[number]', :with => berth['number']
  	fill_in 'berth[length]', :with => berth['length']
  	fill_in 'berth[width]', :with => berth['width']
  	fill_in 'berth[depth]', :with => berth['depth']
  	find(:css, '#berth_exists').set(true)

  	click_button "lisaa_laituripaikka"
  end
end