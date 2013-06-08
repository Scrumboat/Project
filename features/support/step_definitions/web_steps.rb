
Given(/^I am on the "(.*?)" page$/) do |page|
  visit page 
end

Given(/^I click "(.*?)"$/) do |arg1|
  click_link_or_button arg1
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