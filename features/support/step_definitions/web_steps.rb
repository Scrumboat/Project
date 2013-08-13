
Given(/^I am on the "(.*?)" page$/) do |page|
  visit page 
end

Given(/^I click "(.*?)"$/) do |arg1|
	first(:link, arg1).click
end

Given(/^I push "(.*?)"$/) do |arg1|
  first('a', :text => arg1).click
end

When(/^I visit "(.*?)" page$/) do |page|
  visit page
end

Then(/^page should have content "(.*?)"$/) do |content|
  page.should have_content content
end

Then(/^page should have button "(.*?)"$/) do |button|
  page.should have_selector(:link_or_button, button)
end