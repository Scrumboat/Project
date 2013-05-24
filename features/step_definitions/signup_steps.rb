# encoding: utf-8
Given(/^I am on the sign in page$/) do
  visit('/admins/sign_in')
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link "Rekisteröidy"
end

Then(/^I should be directed to sign up page$/) do
  page.should have_content("Rekisteröityminen")
  page.should have_content("Sähköposti")
  page.should have_content("Salasana")
  page.should have_content("Salasanan vahvistus")
end

Given(/^I am on the sign up page$/) do
  visit('/admins/sign_up')
end

When(/^I submit email and password$/) do
  fill_in 'admin[email]', :with => 'user@example.com'
  fill_in 'admin[password]', :with => 'password'
  fill_in 'admin[password_confirmation]', :with => 'password'
  click_button 'Rekisteröidy'
end

Then(/^I should be signed in$/) do
  page.should have_content('Tervetuloa! Rekisteröintisi onnistui.')
end


