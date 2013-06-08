When(/^the following docks exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |dock|
  	Dock.create!(:length => dock['length'])
  end
end
