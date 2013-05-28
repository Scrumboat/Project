# encoding: utf-8
Given(/^I am not signed in and I am on the home page$/) do
  visit('/')
end

When(/^I go to the boats page$/) do
  visit('/boats')
end

Then(/^I should be on the "(.*?)" page$/) do |path|
  current_path.should == path
end

Then(/^page should have content "(.*?)"$/) do |content|
  page.should have_content(content)
end

When(/^I go to the members page$/) do
  visit('/members')
end

Given(/^I am on the "(.*?)" page$/) do |page|
  if page.match "home"
    visit "/"
  end
end

Given(/^I sign up as "(.*?)" and "(.*?)"$/) do |email, password|
  admin = Admin.create! do |admin|
    admin.email = email
    admin.password = password
    admin.password_confirmation = password
  end
end

When(/^I login as "(.*?)" and "(.*?)"$/) do |email, password|
  visit '/'
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => password
  click_button 'Kirjaudu'
end

Given(/^I log in as admin$/) do
  admin = Admin.create! do |admin|
    admin.email = "test@scrumboat.com"
    admin.password = "password"
    admin.password_confirmation = "password"
  end
  visit '/'
  fill_in 'admin[email]', :with => "test@scrumboat.com"
  fill_in 'admin[password]', :with => "password"
  click_button 'Kirjaudu'
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link arg1
end




