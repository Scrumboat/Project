# encoding: utf-8
Given(/^I am not signed in and I am on the home page$/) do
  visit('/')
end

When(/^I go to the boats page$/) do
  visit('/boats')
end

Then(/^I should be directed to sign in page$/) do
  page.should have_content("You need to sign in or sign up before continuing.")
end

When(/^I go to the members page$/) do
  visit('/members')
end

Given(/^I am on the "(.*?)"$/) do |arg1|
  visit('/')  
end

When(/^I submit email "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  fill_in 'admin[email]', :with => arg1
  fill_in 'admin[password]', :with => arg2
  click_button 'Kirjaudu'
end

Given(/^I have signed up to the application with email: "(.*?)" and password: "(.*?)"$/) do |arg1, arg2|
  admin = Admin.create! do |admin|
  	admin.email = arg1
  	admin.password = arg2
  	admin.password_confirmation = arg2
  end
end

Then(/^I should be signed in$/) do
  page.should have_content('success')
end

