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
