# encoding: utf-8
Given(/^I am not signed in and I am on the home page$/) do
  visit('/')
end

When(/^I login as "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  login arg1, arg2
end

Given(/^I login as admin$/) do
  sign_up 'admin@scrumboat.com', 'password'
  login 'admin@scrumboat.com', 'password'
end

Given(/^I sign up as "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  sign_up arg1, arg2
end

Then(/^I should be signed in$/) do
  page.should have_content('onnistui')
end

def sign_up arg1, arg2
  admin = Admin.create! do |admin|
    admin.email = arg1
    admin.password = arg2
    admin.password_confirmation = arg2
  end
end

def login arg1, arg2
  visit '/'
  fill_in 'admin[email]', :with => arg1
  fill_in 'admin[password]', :with => arg2
  click_button 'Kirjaudu'
end


