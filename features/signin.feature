# encoding: utf-8
Feature: Sign in
	In order to sign in to app
	A user who is not signed in
	Should be able to sign in to the application

	Scenario: Direct user to the sign in page
		Given I am not signed in and I am on the home page
		When I go to the boats page
		Then I should be on the "/admins/sign_in" page
		And page should have content "You need to sign in or sign up before continuing."

	Scenario: Direct user to the sign in page
		Given I am not signed in and I am on the home page
		When I go to the members page
		Then I should be on the "/admins/sign_in" page

	Scenario: Sign in user to the application
		Given I am on the "home" page
		Given I sign up as "test@scrumboat.com" and "password"
		When I login as "test@scrumboat.com" and "password"
		Then page should have content "success"

