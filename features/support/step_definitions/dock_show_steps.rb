Given(/^the following berths exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |berth|
  	Berth.create!(:number => berth['number'], :length => berth['length'], :width => berth['width'], :depth => berth['depth'],
  		:exists => berth['exists'], :dock_id =>berth['dock_id'])
  end
end


